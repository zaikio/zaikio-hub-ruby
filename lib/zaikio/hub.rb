require "faraday"
require "spyke"
require "zaikio-client-helpers"

require "zaikio/hub/configuration"
require "zaikio/hub/basic_auth_middleware"

# Models
require "zaikio/hub/client"
require "zaikio/hub/base"
require "zaikio/hub/asset"
require "zaikio/hub/organization_membership"
require "zaikio/hub/business_relationship"
require "zaikio/hub/organization"
require "zaikio/hub/person"
require "zaikio/hub/machine"
require "zaikio/hub/software"
require "zaikio/hub/specialist"
require "zaikio/hub/address"
require "zaikio/hub/site"
require "zaikio/hub/membership"
require "zaikio/hub/current_person"
require "zaikio/hub/current_organization"
require "zaikio/hub/role"
require "zaikio/hub/revoked_access_token"
require "zaikio/hub/connection"
require "zaikio/hub/app"
require "zaikio/hub/subscription"
require "zaikio/hub/subscription_invitation"
require "zaikio/hub/test_account"
require "zaikio/hub/token_data"

module Zaikio
  module Hub
    class << self
      attr_accessor :configuration

      class_attribute :connection

      def configure
        self.connection = nil
        self.configuration ||= Configuration.new
        yield(configuration)

        Base.connection = create_connection
      end

      def with_token(token, &block)
        Zaikio::Client.with_token(token, &block)
      end

      def with_basic_auth(login, password)
        BasicAuthMiddleware.credentials = [login, password]
        yield
      ensure
        BasicAuthMiddleware.reset_credentials
      end

      def current_token_data
        return unless Zaikio::Client::Helpers::AuthorizationMiddleware.token

        payload = JWT.decode(
          Zaikio::Client::Helpers::AuthorizationMiddleware.token,
          nil,
          false
        ).first

        create_token_data(payload)
      end

      def create_connection
        self.connection = Zaikio::Client.create_connection(configuration).tap do |c|
          c.use BasicAuthMiddleware
        end
      end

      def create_token_data(payload)
        TokenData.from(payload)
      end
    end
  end
end
