module Zaikio
  module Hub
    class TestAccount < Base
      uri "test_accounts(/:id)"

      include_root_in_json :test_account

      # Attributes
      attributes :name, :slug, :logo_url, :connected, :subscription,
                 :created_at, :updated_at, :country_code, :kinds,
                 :sections, :currency, :brand_color, :test_account_owner_id,
                 :private_access_token, :site_attributes, :member_attributes,
                 :subscription_attributes, :connection_attributes

      # Associations
      has_many :memberships, class_name: "Zaikio::Hub::Membership",
                             uri: nil
      has_many :sites, class_name: "Zaikio::Hub::Site",
                       uri: nil
    end
  end
end
