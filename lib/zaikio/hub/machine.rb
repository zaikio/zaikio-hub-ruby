module Zaikio
  module Hub
    class Machine < Base
      include Asset

      uri "machines(/:id)"
      include_root_in_json :machine

      # Attributes
      attributes :name, :updated_at, :created_at, :site_id, :kind, :capabilities,
                 :manufacturer_id, :serial_number, :manufacturer, :owner_id, :reference

      # Associations
      has_many :availabilities, class_name: "Zaikio::Hub::Availability",
                                uri: "machines/:machine_id/availabilities"

      def self.kinds
        %w[sheetfed_digital_press web_digital_press digital_press sheetfed_offset_press
           web_offset_press offset_press cutter shape_cutter folder box_maker
           gatherer stitcher adhesive_binder trimmer thread_sewer case_maker
           box_packer ctp platesetter flexo_press silkscreen_press web_silkscreen_press
           inkjet_press web_inkjet_press letterpress_press pad_press laminator
           corner_rounder spindle_drill binder book_puncher perforator eyeletter drill
           drill_puncher notcher].freeze
      end
    end
  end
end
