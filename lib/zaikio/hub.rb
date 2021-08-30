require "faraday"
require "spyke"
require "zaikio-client-helpers"

require "zaikio/hub/configuration"
require "zaikio/hub/authorization_middleware"
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
require "zaikio/hub/test_account"

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

      def with_token(token)
        AuthorizationMiddleware.token = token
        yield
      ensure
        AuthorizationMiddleware.reset_token
      end

      def with_basic_auth(login, password)
        BasicAuthMiddleware.credentials = [login, password]
        yield
      ensure
        BasicAuthMiddleware.reset_credentials
      end

      def current_token_data
        return unless AuthorizationMiddleware.token

        payload = JWT.decode(AuthorizationMiddleware.token, nil, false).first

        create_token_data(payload)
      end

      def create_connection
        self.connection = Faraday.new(url: "#{configuration.host}/api/v1",
                                      ssl: { verify: configuration.environment != :test }) do |c|
          c.request     :json
          c.response    :logger, configuration&.logger, headers: false
          c.use         Zaikio::Client::Helpers::Pagination::FaradayMiddleware
          c.use         Zaikio::Client::Helpers::JSONParser
          c.use         AuthorizationMiddleware
          c.use         BasicAuthMiddleware
          c.adapter     Faraday.default_adapter
        end
      end

      def create_token_data(payload)
        subjects = payload["sub"].split(">")

        OpenStruct.new(
          audience: payload["aud"].first,
          on_behalf_of_id: subjects.first.split("/").last,
          subject_id: subjects.last.split("/").last,
          subject_type: subjects.last.split("/").first,
          scopes: payload["scope"]
        )
      end
    end
  end
end
