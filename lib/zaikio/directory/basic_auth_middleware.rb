require "faraday"
require "base64"

module Zaikio
  module Directory
    class BasicAuthMiddleware < Faraday::Middleware
      def self.reset_credentials
        @credentials = nil
      end

      def self.credentials(credentials = nil)
        @credentials = credentials || @credentials
      end

      def call(request_env)
        if self.class.credentials
          value = Base64.encode64(self.class.credentials.join(":"))
          value.delete!("\n")
          request_env[:request_headers]["Authorization"] = "Basic #{value}"
        end

        @app.call(request_env).on_complete do |response_env|
        end
      end
    end
  end
end
