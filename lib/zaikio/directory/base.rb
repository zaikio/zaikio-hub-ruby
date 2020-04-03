module Zaikio
  module Directory
    class Base < Spyke::Base
      self.callback_methods = { create: :post, update: :patch }.freeze
    end
  end
end
