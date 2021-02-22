module Zaikio
  module Hub
    class Site < Base
      uri "sites(/:id)"
      include_root_in_json :site

      # Attributes
      attributes :name, :headquarter, :created_at, :updated_at, :address,
                 :address_attributes

      # Associations
      has_one :address, uri: nil, class_name: "Zaikio::Hub::Address"

      accepts_nested_attributes_for :address

      # Callbacks
      before_save :set_address_attributes

      private

      def set_address_attributes
        attributes[:address_attributes] = address
      end
    end
  end
end
