module Zaikio
  module Directory
    class CurrentOrganization < Base
      self.primary_key = nil
      include_root_in_json :organization
      uri "organization"

      def self.find
        all.find_one
      end

      def self.find_with_fallback(fallback)
        all.with_fallback(fallback).find_one
      end

      # Associations
      has_many :memberships,             class_name: "Zaikio::Directory::Membership",
                                         uri: "organization/memberships(/:id)"
      has_many :business_relationships,  class_name: "Zaikio::Directory::BusinessRelationship",
                                         uri: "organization/business_relationships(/:id)"
      has_many :software,                class_name: "Zaikio::Directory::Software",
                                         uri: "software(/:id)"
      has_many :machines,                class_name: "Zaikio::Directory::Machine",
                                         uri: "machines(/:id)"
      has_many :sites,                   class_name: "Zaikio::Directory::Site",
                                         uri: "sites(/:id)"

      def fetch
        self.attributes = get
      end

      def members
        memberships.with_fallback.map(&:person)
      end
    end
  end
end
