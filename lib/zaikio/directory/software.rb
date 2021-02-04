module Zaikio
  module Directory
    class Software < Base
      include Asset

      uri "software(/:id)"
      include_root_in_json :software

      # Attributes
      attributes :name, :updated_at, :created_at, :site_id, :kind, :owner_id,
                 :vendor_id, :vendor

      private

      def collection_name
        "software"
      end
    end
  end
end
