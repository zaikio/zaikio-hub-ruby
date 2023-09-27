module Zaikio
  module Hub
    class VendorApp < Base
      uri "apps(/:id)"

      include_root_in_json :app

      # Attributes
      attributes :name, :category, :kind, :state, :configuration
    end
  end
end
