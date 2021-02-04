module Zaikio
  module Directory
    class Role < Base
      uri "roles"

      include_root_in_json :role

      # Attributes
      attributes :name
    end
  end
end
