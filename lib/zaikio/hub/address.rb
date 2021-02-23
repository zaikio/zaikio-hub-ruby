module Zaikio
  module Hub
    class Address < Base
      # Attributes
      attributes :addressee, :text, :country_code, :town,
                 :street_and_number, :zip_code, :addition

      # Associations
      belongs_to :site, uri: nil, class_name: "Zaikio::Hub::Site"
    end
  end
end
