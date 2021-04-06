module Zaikio
  module Hub
    class CurrentPerson < Base
      self.primary_key = nil
      include_root_in_json :person
      uri "person"

      # Attributes
      attributes :updated_at, :created_at, :first_name, :name, :full_name, :email,
                 :pronoun, :locale, :country_code, :currency, :unit_system, :connected,
                 :test_account_owner_id, :time_zone, :email_confirmed,
                 :two_factor_authentication_enabled, :avatar_url, :subscription,
                 :accessible_apps, :granted_oauth_scopes, :requested_oauth_scopes,
                 :requested_oauth_scopes_waiting_for_approval

      def self.find
        all.find_one
      end

      def self.find_with_fallback(fallback)
        all.with_fallback(fallback).find_one
      end

      # Associations
      has_many :organization_memberships, class_name: "Zaikio::Hub::OrganizationMembership",
                                          uri: nil

      def fetch
        self.attributes = get
      end

      def organizations
        organization_memberships.with_fallback.map(&:organization)
      end

      def admin_organizations
        organization_memberships.map do |m|
          m.organization if m.roles.include?("admin") || m.roles.include?("owner")
        end.compact
      end
    end
  end
end
