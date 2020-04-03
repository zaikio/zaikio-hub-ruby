module Zaikio
  module Directory
    class Role < Base
      uri "roles"

      include_root_in_json :role
    end
  end
end
