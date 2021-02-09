module Zaikio
  module Hub
    class Site < Base
      uri "sites(/:id)"
      include_root_in_json :site

      # Attributes
      attributes :name, :headquarter, :created_at, :updated_at, :address,
                 :address_attributes
    end
  end
end
