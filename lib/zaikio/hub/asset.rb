module Zaikio
  module Hub
    module Asset
      extend ActiveSupport::Concern

      included do
        # Callbacks
        after_create :make_organization_owner
      end

      def make_organization_owner
        if Zaikio::Hub.current_token_data.subject_type == "Organization"
          self.class.request(:post,
                             "#{collection_name}/#{id}/#{singular_name}_ownership")
        else
          org_path = "person/organizations/#{organization_id}"
          self.class.request(:post,
                             "#{org_path}/#{collection_name}/#{id}/#{singular_name}_ownership")
        end
      end

      def destroy
        if Zaikio::Hub.current_token_data.subject_type == "Organization"
          self.class.request(:delete,
                             "#{collection_name}/#{id}/#{singular_name}_ownership")
        else
          org_path = "person/organizations/#{owner_id || organization_id}"
          self.class.request(:delete,
                             "#{org_path}/#{collection_name}/#{id}/#{singular_name}_ownership")
        end
      end

      def specification
        prefix = if Zaikio::Hub.current_token_data.subject_type == "Person"
                   "person/organizations/#{owner_id || organization_id}/"
                 else
                   ""
                 end
        self.class.request(:get,
                           "#{prefix}#{collection_name}/#{id}/#{singular_name}_specification")
            &.body&.dig("data")
      end

      private

      def collection_name
        self.class.name.demodulize.underscore.pluralize
      end

      def singular_name
        self.class.name.demodulize.underscore
      end
    end
  end
end
