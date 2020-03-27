ENV["RACK_ENV"] = "test"

require "active_support/all"
require "minitest/autorun"
require "mocha/minitest"
require "webmock/minitest"
require "zaikio/directory"

# Filter out the backtrace from minitest while preserving the one from other libraries.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

class ActiveSupport::TestCase
end
