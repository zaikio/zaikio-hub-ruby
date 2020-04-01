module Zaikio
  module Directory
    class Membership < Base
      include_root_in_json :membership
      has_one :person, uri: nil, class_name: "Zaikio::Directory::Person"
    end
  end
end
