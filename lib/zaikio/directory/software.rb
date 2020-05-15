module Zaikio
  module Directory
    class Software < Base
      include Asset

      uri "software(/:id)"
      include_root_in_json :software

      private

      def collection_name
        "software"
      end
    end
  end
end
