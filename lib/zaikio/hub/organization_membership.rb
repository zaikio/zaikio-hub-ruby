module Zaikio
  module Hub
    class OrganizationMembership < Base
      uri "person/organization_memberships"

      include_root_in_json :organization_membership

      # Attributes
      attributes :updated_at, :created_at, :roles

      # Associations
      has_one :organization, class_name: "Zaikio::Hub::Organization"
    end
  end
end
