module Zaikio
  module Hub
    module Asset
      extend ActiveSupport::Concern

      # Constants
      def self.capabilities
        %w[
          ctp digital_printing digital_web_printing inkjet_printing inkjet_web_printing
          offset_printing offset_uv_printing offset_uvle_printing offset_web_printing
          offset_web_uv_printing offset_web_uvle_printing flexo_printing letterpress_printing
          pad_printing pre_cutting cutting intermediate_cutting folding laminating perfect_binding
          hole_drilling comb_binding embossing engraving foil_stamping gluing head_banding
          perforating ring_binding saddle_stitching spiral_binding strip_binding thread_sewing
          envelope_stuffing counting wrapping boxing shrink_wrapping addressing franking
        ].freeze
      end

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
