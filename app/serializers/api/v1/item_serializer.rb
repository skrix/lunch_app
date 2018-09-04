# frozen_string_literal: true

module Api
  module V1
    class ItemSerializer
      include FastJsonapi::ObjectSerializer
      attributes :id, :name, :kind, :price
    end
  end
end
