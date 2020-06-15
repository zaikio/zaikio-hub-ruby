require "faraday"
require "jwt"

module Zaikio
  module Directory
    class AuthorizationMiddleware < Faraday::Middleware
      class_attribute :token

      def self.reset_token
        self.token = nil
      end

      def call(request_env)
        if self.class.token
          request_env[:request_headers]["Authorization"] = "Bearer #{self.class.token}"
        end

        @app.call(request_env).on_complete do |response_env|
        end
      end
    end
  end
end
