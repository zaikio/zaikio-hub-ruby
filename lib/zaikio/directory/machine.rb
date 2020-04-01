module Zaikio
  module Directory
    class Machine < Base
      uri "machines(/:id)"
      include_root_in_json :machine

      # Callbacks
      after_create :make_organization_owner

      def make_organization_owner
        if Zaikio::Directory.current_token_data.subject_type == "Organization"
          self.class.request(:post, "machines/#{id}/machine_ownership")
        else
          org_path = "person/organizations/#{organization_id}"
          self.class.request(:post, "#{org_path}/machines/#{id}/machine_ownership")
        end
      end

      def destroy
        if Zaikio::Directory.current_token_data.subject_type == "Organization"
          self.class.request(:delete, "machines/#{id}/machine_ownership")
        else
          org_path = "person/organizations/#{owner_id || organization_id}"
          self.class.request(:delete, "#{org_path}/machines/#{id}/machine_ownership")
        end
      end
    end
  end
end
