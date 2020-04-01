module Zaikio
  module Directory
    class Organization < Base
      uri "person/organizations"

      include_root_in_json :organization

      # Associations
      has_many :memberships,             class_name: "Zaikio::Directory::Membership",
                                         uri: "person/organizations/:organization_id/memberships"
      has_many :software,                class_name: "Zaikio::Directory::Software",
                                         uri: "person/organizations/:organization_id/software"
      has_many :machines,                class_name: "Zaikio::Directory::Machine",
                                         uri: "person/organizations/:organization_id/machines"
      has_many :sites,                   class_name: "Zaikio::Directory::Site",
                                         uri: "person/organizations/:organization_id/sites"
    end
  end
end
