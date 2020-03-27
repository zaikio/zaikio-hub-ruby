require "zaikio/directory/configuration"

module Zaikio
  module Directory
    class << self
      attr_accessor :configuration

      def configure
        self.configuration ||= Configuration.new
        yield(configuration)
      end
    end
  end
end
