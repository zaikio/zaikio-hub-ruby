module Zaikio
  module Directory
    class Connection < Base
      uri "connections(/:id)"

      include_root_in_json :connection

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
