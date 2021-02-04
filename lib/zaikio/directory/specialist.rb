module Zaikio
  module Directory
    class Specialist < Base
      include Asset

      uri "specialists(/:id)"
      include_root_in_json :specialist

      # Attributes
      attributes :name, :updated_at, :created_at, :site_id, :kind, :owner_id
    end
  end
end
