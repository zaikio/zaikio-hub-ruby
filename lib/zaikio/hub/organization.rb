module Zaikio
  module Hub
    class Organization < Base
      uri "person/organizations"

      include_root_in_json :organization

      # Attributes
      attributes :name, :slug, :logo_url, :connected, :subscription,
                 :created_at, :updated_at, :country_code, :kinds,
                 :sections, :currency, :brand_color, :test_account_owner_id,
                 :granted_oauth_scopes, :requested_oauth_scopes,
                 :requested_oauth_scopes_waiting_for_approval

      # Associations
      has_many :memberships,             class_name: "Zaikio::Hub::Membership",
                                         uri: "person/organizations/:organization_id/memberships"
      has_many :software,                class_name: "Zaikio::Hub::Software",
                                         uri: "person/organizations/:organization_id/software"
      has_many :machines,                class_name: "Zaikio::Hub::Machine",
                                         uri: "person/organizations/:organization_id/machines"
      has_many :specialists,             class_name: "Zaikio::Hub::Specialist",
                                         uri: "person/organizations/:organization_id/specialists"
      has_many :sites,                   class_name: "Zaikio::Hub::Site",
                                         uri: "person/organizations/:organization_id/sites"
    end
  end
end
