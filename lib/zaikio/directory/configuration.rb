require "logger"

module Zaikio
  module Directory
    class Configuration
      HOSTS = {
        development: "http://directory.zaikio.test",
        test: "http://directory.zaikio.test",
        staging: "https://directory.staging.zaikio.com",
        sandbox: "https://directory.sandbox.zaikio.com",
        production: "https://directory.zaikio.com"
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
