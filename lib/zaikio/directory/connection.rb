module Zaikio
  module Directory
    class Connection < Base
      uri "connections"

      include_root_in_json :connection
    end
  end
end
