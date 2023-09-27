module Zaikio
  module Hub
    class AccessToken < Base
      uri "access_token"

      include_root_in_json :access_token

      # Associations
      has_one :app, class_name: "Zaikio::Hub::App", uri: nil
    end
  end
end
