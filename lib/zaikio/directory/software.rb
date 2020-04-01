module Zaikio
  module Directory
    class Software < Base
      uri "software(/:id)"
      include_root_in_json :software

      # Callbacks
      after_create :make_organization_owner

      def make_organization_owner
        if Zaikio::Directory.current_token_data.subject_type == "Organization"
          self.class.request(:post, "software/#{id}/software_ownership")
        else
          org_path = "person/organizations/#{organization_id}"
          self.class.request(:post, "#{org_path}/software/#{id}/software_ownership")
        end
      end

      def destroy
        if Zaikio::Directory.current_token_data.subject_type == "Organization"
          self.class.request(:delete, "software/#{id}/software_ownership")
        else
          org_path = "person/organizations/#{owner_id || organization_id}"
          self.class.request(:delete, "#{org_path}/software/#{id}/software_ownership")
        end
      end
    end
  end
end
