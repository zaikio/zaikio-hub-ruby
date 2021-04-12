module Zaikio
  module Hub
    module Pagination
      class HeaderParser < Faraday::Response::Middleware
        def on_complete(env)
          @env = env

          metadata = Zaikio::Hub::Pagination::HEADERS.transform_values do |key|
            header(key)
          end

          @env.body[:metadata] ||= {}
          @env.body[:metadata][Zaikio::Hub::Pagination::METADATA_KEY] = metadata
        end

        private

        def header(key)
          value = @env.response_headers[key]
          value.try(:to_i)
        end
      end
    end
  end
end
