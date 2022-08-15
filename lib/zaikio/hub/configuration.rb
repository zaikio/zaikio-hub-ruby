require "logger"

module Zaikio
  module Hub
    class Configuration < Zaikio::Client::Helpers::Configuration
      def self.hosts
        {
          development: "https://hub.zaikio.test/api/v1",
          test: "https://hub.zaikio.test/api/v1",
          staging: "https://hub.staging.zaikio.com/api/v1",
          sandbox: "https://hub.sandbox.zaikio.com/api/v1",
          production: "https://hub.zaikio.com/api/v1"
        }.freeze
      end
    end
  end
end
