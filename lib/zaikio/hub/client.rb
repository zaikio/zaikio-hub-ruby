require "jwt"

module Zaikio
  module Hub
    class RequestWrapper
      def initialize(result, client)
        @result = result
        @client = client
      end

      def respond_to_missing?(method_name, include_private = false)
        @result.respond_to?(method_name, include_private) || super
      end

      def method_missing(method_name, *args, &block)
        result = @client.with_auth { @result.public_send(method_name, *args, &block) }

        if result.is_a?(Spyke::Base) || result.is_a?(Spyke::Relation)
          RequestWrapper.new(result, @client)
        else
          result
        end
      end

      def each_page
        super() do |page|
          page = RequestWrapper.new(page, @client)
          yield(page)
        end
      end
    end

    class Client
      def self.from_token(token)
        new(token: token)
      end

      def self.from_credentials(client_id, client_secret)
        new(client_id: client_id, client_secret: client_secret)
      end

      def initialize(token: nil, client_id: nil, client_secret: nil)
        @token = token
        @client_id = client_id
        @client_secret = client_secret
      end

      def jwt
        return if @token.nil?

        @jwt ||= begin
          payload = JWT.decode(@token, nil, false).first

          Zaikio::Hub.create_token_data(payload)
        end
      end

      def organization?
        jwt&.subject_type == "Organization"
      end

      def person?
        jwt&.subject_type == "Person"
      end

      def credentials?
        @token.nil?
      end

      def subject_class
        if organization?
          Zaikio::Hub::CurrentOrganization
        elsif person?
          Zaikio::Hub::CurrentPerson
        end
      end

      def with_auth(&block)
        if @token.nil?
          Zaikio::Hub.with_basic_auth(@client_id, @client_secret, &block)
        else
          Zaikio::Hub.with_token(@token, &block)
        end
      end

      def organization
        raise "Current organization is not available for person" unless organization?

        with_auth { Zaikio::Hub::CurrentOrganization.find }
      end

      def person
        raise "Current person is not available for organization" unless person?

        with_auth { Zaikio::Hub::CurrentPerson.find }
      end

      def connections
        raise "Only available with credentials" unless credentials?

        RequestWrapper.new(Zaikio::Hub::Connection.all, self)
      end

      def subscriptions
        raise "Only available with credentials" unless credentials?

        RequestWrapper.new(Zaikio::Hub::Subscription.all, self)
      end

      def test_accounts
        raise "Only available with credentials" unless credentials?

        RequestWrapper.new(Zaikio::Hub::TestAccount.all, self)
      end

      def respond_to_missing?(method_name, include_private = false)
        return super if credentials?

        subject_class.new.respond_to?(method_name, include_private) || super
      end

      def method_missing(method_name, *args, &block)
        result = with_auth { subject_class.new.public_send(method_name, *args, &block) }

        RequestWrapper.new(result, self)
      end
    end
  end
end
