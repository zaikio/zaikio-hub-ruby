module Zaikio
  module Directory
    class TestAccount < Base
      uri "test_accounts(/:id)"

      include_root_in_json :test_account

      # Associations
      has_many :memberships, class_name: "Zaikio::Directory::Membership",
                             uri: nil
      has_many :sites, class_name: "Zaikio::Directory::Site",
                       uri: nil
    end
  end
end
