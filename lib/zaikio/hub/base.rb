module Zaikio
  module Hub
    class Base < Spyke::Base
      self.callback_methods = { create: :post, update: :patch }.freeze
    end
  end
end
