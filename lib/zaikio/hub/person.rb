module Zaikio
  module Hub
    class Person < Base
      # Attributes
      attributes :updated_at, :created_at, :first_name, :name, :full_name, :email,
                 :pronoun, :locale, :country_code, :currency, :unit_system, :connected,
                 :test_account_owner_id, :time_zone, :email_confirmed,
                 :two_factor_authentication_enabled, :avatar_url, :subscription
    end
  end
end
