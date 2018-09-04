# frozen_string_literal: true

module Api
  module V1
    class MealSerializer
      include FastJsonapi::ObjectSerializer

      attributes :id, :price, :item_id
    end
  end
end
