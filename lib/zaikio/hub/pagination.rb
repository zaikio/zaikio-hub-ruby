# adapted from https://github.com/balvig/spyke-kaminari

module Zaikio
  module Hub
    module Pagination
      HEADERS = {
        total_count: "Total-Count",
        total_pages: "Total-Pages",
        current_page: "Current-Page"
      }.freeze

      METADATA_KEY = :pagination
    end
  end
end

require "zaikio/hub/pagination/scopes"
require "zaikio/hub/pagination/relation"
require "zaikio/hub/pagination/header_parser"
