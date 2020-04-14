require "multi_json"

module Zaikio
  module Directory
    class JSONParser < Faraday::Response::Middleware
      def on_complete(env)
        unless /^(2\d\d)|422$/.match?(env.status.to_s)
          Zaikio::Directory.configuration.logger
                           .error("Zaikio::Directory Status Code #{env.status}, #{env.body}")
          raise Spyke::ConnectionError, "Status Code #{env.status}, #{env.body}"
        end

        env.body = parse_body(env.body)
      end

      def parse_body(body)
        json = MultiJson.load(body, symbolize_keys: true)
        {
          data: json,
          metadata: {},
          errors: json.is_a?(Hash) ? json[:errors] : {}
        }
      rescue MultiJson::ParseError
        {
          data: {},
          metadata: {},
          errors: { "base" => body }
        }
      end
    end
  end
end
