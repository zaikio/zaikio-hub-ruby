module Zaikio
  class Error < StandardError; end
  class ConnectionError < Zaikio::Error; end
  class ResourceNotFound < Zaikio::Error; end
end

module Spyke
  ConnectionError = Class.new Zaikio::ConnectionError
  ResourceNotFound = Class.new Zaikio::ResourceNotFound
end
