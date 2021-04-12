module Zaikio
  module Hub
    module Pagination
      module Scopes
        extend ActiveSupport::Concern

        included do
          %i[page per_page].each do |symbol|
            scope symbol, ->(value) { where(symbol => value) }
          end
        end

        module ClassMethods
          # Overrides the method included by Spyke::Scoping to return paginated
          # relations.
          def all
            current_scope || Zaikio::Hub::Pagination::Relation.new(self, uri: uri)
          end
        end
      end
    end
  end
end
