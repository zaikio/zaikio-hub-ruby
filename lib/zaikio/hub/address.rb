module Zaikio
  module Hub
    class Address < Base
      # Attributes
      attributes :addressee,
                 :addition,
                 :country_code,
                 :street_and_number,
                 :text,
                 :town,
                 :zip_code

      # Associations
      belongs_to :site, uri: nil, class_name: "Zaikio::Hub::Site"
    end
  end
end
