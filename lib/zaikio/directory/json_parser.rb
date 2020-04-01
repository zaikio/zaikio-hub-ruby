require "multi_json"

module Zaikio
  module Directory
    class JSONParser < Faraday::Response::Middleware
      def parse(body)
        json = MultiJson.load(body, symbolize_keys: true)
        {
          data: json,
          metadata: {},
          errors: json.is_a?(Hash) ? json[:errors] : {}
        }
      end
    end
  end
end
