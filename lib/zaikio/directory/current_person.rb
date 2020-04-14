module Zaikio
  module Directory
    class CurrentPerson < Base
      self.primary_key = nil
      include_root_in_json :person
      uri "person"

      def self.find
        all.find_one
      end

      def self.find_with_fallback(fallback)
        all.with_fallback(fallback).find_one
      end

      # Associations
      has_many :organization_memberships, class_name: "Zaikio::Directory::OrganizationMembership",
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
