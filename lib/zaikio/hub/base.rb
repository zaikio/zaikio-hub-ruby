require "zaikio/client/model"

module Zaikio
  module Hub
    class Base < Zaikio::Client::Model
      self.callback_methods = { create: :post, update: :patch }.freeze
    end
  end
end
