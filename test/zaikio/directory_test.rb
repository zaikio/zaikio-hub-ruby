require "test_helper"

class Zaikio::Directory::Test < ActiveSupport::TestCase
  def setup
    Zaikio::Directory.configure do |config|
      config.environment = :test
    end
  end

  test "is a module" do
    assert_kind_of Module, Zaikio::Directory
  end

  test "has version number" do
    assert_not_nil ::Zaikio::Directory::VERSION
  end

  test "it is configurable" do
    Zaikio::Directory.configure do |config|
      config.environment = :test
    end

    assert_equal :test, Zaikio::Directory.configuration.environment
  end
end
