module Zaikio
  module Hub
    class Subscription < Base
      uri "subscriptions(/:id)"

      include_root_in_json :subscription

      # Attributes
      attributes :updated_at, :created_at, :subscriber_type, :subscriber_id,
                 :status, :app_name, :activated_at, :last_billed_at,
                 :last_paid_at, :trial_ended_at, :plan, :preceding_plan,
                 :changed_plan_at, :usages_in_current_billing_period

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
