module Zaikio
  module Hub
    class SubscriptionInvitation < Base
      uri "subscription_invitations(/:id)"

      include_root_in_json :subscription_invitation

      # Attributes
      attributes :updated_at, :created_at, :app_name, :plan, :organization_name,
                 :contact_person, :starting_at, :expires_at, :invitation_url, :created_at,
                 :updated_at
    end
  end
end
