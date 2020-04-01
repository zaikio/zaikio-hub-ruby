module Zaikio
  module Directory
    class Site < Base
      uri "sites(/:id)"
      include_root_in_json :site
    end
  end
end
