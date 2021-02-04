module Zaikio
  module Directory
    class Organization < Base
      uri "person/organizations"

      include_root_in_json :organization

      # Attributes
      attributes :name, :slug, :logo_url, :connected, :subscription,
                 :created_at, :updated_at, :country_code, :kinds,
                 :sections, :currency, :brand_color, :test_account_owner_id

      # Associations
      has_many :memberships,             class_name: "Zaikio::Directory::Membership",
                                         uri: "person/organizations/:organization_id/memberships"
      has_many :software,                class_name: "Zaikio::Directory::Software",
                                         uri: "person/organizations/:organization_id/software"
      has_many :machines,                class_name: "Zaikio::Directory::Machine",
                                         uri: "person/organizations/:organization_id/machines"
      has_many :specialists,             class_name: "Zaikio::Directory::Specialist",
                                         uri: "person/organizations/:organization_id/specialists"
      has_many :sites,                   class_name: "Zaikio::Directory::Site",
                                         uri: "person/organizations/:organization_id/sites"
    end
  end
end
