module Zaikio
  module Directory
    class Machine < Base
      include Asset

      uri "machines(/:id)"
      include_root_in_json :machine
    end
  end
end
