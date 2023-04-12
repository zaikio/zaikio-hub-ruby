module Zaikio
  module Hub
    class Machine < Base
      include Asset

      uri "machines(/:id)"
      include_root_in_json :machine

      # Attributes
      attributes :name, :updated_at, :created_at, :site_id, :kind, :capabilities,
                 :manufacturer_id, :serial_number, :manufacturer, :owner_id
    end
  end
end
