require "faraday"
require "base64"

module Zaikio
  module Hub
    class BasicAuthMiddleware < Faraday::Middleware
      class_attribute :credentials

      def self.credentials
        @credentials ||= Concurrent::ThreadLocalVar.new { nil }
        @credentials.value
      end

      def self.credentials=(value)
        @credentials ||= Concurrent::ThreadLocalVar.new { nil }
        @credentials.value = value
      end

      def self.reset_credentials
        self.credentials = nil
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
