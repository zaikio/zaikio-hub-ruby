require "faraday"
require "jwt"

module Zaikio
  module Directory
    class AuthorizationMiddleware < Faraday::Middleware
      def self.reset_token
        @token = nil
      end

      def self.token(token = nil)
        @token = token || @token
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
