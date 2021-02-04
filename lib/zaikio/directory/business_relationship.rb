module Zaikio
  module Directory
    class BusinessRelationship < Base
      uri "organization/business_relationships(/:id)"

      # Attributes
      attributes :kind, :updated_at, :created_at, :reference,
                 :target_id, :target_name
    end
  end
end
