module Zaikio
  module Hub
    class App < Base
      uri nil

      # Attributes
      attributes :name, :slug, :title, :logo_url

      # Associations
      has_one :vendor, class_name: "Zaikio::Hub::Vendor"
    end
  end
end
