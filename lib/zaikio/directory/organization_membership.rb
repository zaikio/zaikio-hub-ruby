module Zaikio
  module Directory
    class OrganizationMembership < Base
      uri "person/organization_memberships"

      include_root_in_json :organization_membership

      # Associations
      has_one :organization, class_name: "Zaikio::Directory::Organization"
    end
  end
end
