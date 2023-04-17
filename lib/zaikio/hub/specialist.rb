module Zaikio
  module Hub
    class Specialist < Base
      include Asset

      uri "specialists(/:id)"
      include_root_in_json :specialist

      # Attributes
      attributes :name, :updated_at, :created_at, :site_id, :kind, :owner_id, :capabilities

      def self.kinds
        %w[shipping other boxing].freeze
      end
    end
  end
end
