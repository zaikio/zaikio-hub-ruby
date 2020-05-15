module Zaikio
  module Directory
    class Specialist < Base
      include Asset

      uri "specialists(/:id)"
      include_root_in_json :specialist
    end
  end
end
