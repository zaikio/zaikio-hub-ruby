module Zaikio
  module Hub
    module Pagination
      class Relation < Spyke::Relation
        Zaikio::Hub::Pagination::HEADERS.each_key do |symbol|
          define_method(symbol) do
            find_some.metadata[Zaikio::Hub::Pagination::METADATA_KEY][symbol]
          end
        end

        def first_page?
          current_page == 1
        end

        def next_page
          current_page + 1
        end

        def last_page?
          current_page == total_pages
        end

        def out_of_range?
          current_page > total_pages
        end

        def each_page
          return to_enum(:each_page) unless block_given?

          relation = clone
          yield relation
          return if relation.last_page? || relation.out_of_range?

          (relation.next_page..relation.total_pages).each do |number|
            yield clone.page(number)
          end
        end
      end
    end
  end
end
