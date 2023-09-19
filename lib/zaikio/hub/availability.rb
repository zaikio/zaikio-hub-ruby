module Zaikio
  module Hub
    class Availability < Base
      include_root_in_json :availability

      attributes :machine_id, :mode, :starts_at, :ends_at, :date, :weekday, :reason, :capacity,
                 :description, :machine_id, :specialist_id, :created_at, :updated_at, :starts_at_hm,
                 :ends_at_hm, :reference
    end
  end
end
