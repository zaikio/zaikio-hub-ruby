require "logger"

module Zaikio
  module Directory
    class Configuration
      HOSTS = {
        development: "https://hub.zaikio.test",
        test: "https://hub.zaikio.test",
        staging: "https://hub.staging.zaikio.com",
        sandbox: "https://hub.sandbox.zaikio.com",
        production: "https://hub.zaikio.com"
      }.freeze

      attr_accessor :host
      attr_reader :environment
      attr_writer :logger

      def initialize
        @environment = :sandbox
      end

      def logger
        @logger ||= Logger.new(STDOUT)
      end

      def environment=(env)
        @environment = env.to_sym
        @host = host_for(environment)
      end

      private

      def host_for(environment)
        HOSTS.fetch(environment) do
          raise StandardError.new, "Invalid Zaikio::Directory environment '#{environment}'"
        end
      end
    end
  end
end
