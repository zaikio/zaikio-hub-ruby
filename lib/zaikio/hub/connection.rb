module Zaikio
  module Hub
    class Connection < Base
      uri "connections(/:id)"

      include_root_in_json :connection

      # Attributes
      attributes :updated_at, :created_at, :connectable_type, :connectable_id,
                 :app_name, :granted_oauth_scopes, :requested_oauth_scopes,
                 :requested_oauth_scopes_waiting_for_approval

      def initialize(attributes = {})
        if attributes["connectable_id"]
          super(attributes.merge(
            "id" => "#{attributes['connectable_type']}-#{attributes['connectable_id']}"
          ))
        else
          super
        end
      end
    end
  end
end
