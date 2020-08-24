module Zaikio
  module Directory
    class Subscription < Base
      uri "subscriptions(/:id)"

      include_root_in_json :subscription

      def initialize(attributes = {})
        if attributes["subscriber_id"]
          super(attributes.merge(
            "id" => "#{attributes['subscriber_type']}-#{attributes['subscriber_id']}"
          ))
        else
          super
        end
      end

      def activate!
        update(status: "active")
      end

      def increment_usage_by!(usage, by = 1)
        update(increment_usages_in_current_billing_period: { usage => by })
      end
    end
  end
end
