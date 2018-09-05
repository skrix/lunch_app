# frozen_string_literal: true

module Api
  module V1
    class MealSerializer
      include FastJsonapi::ObjectSerializer

      attributes :id, :price, :item_id

      belongs_to :item, serializer: Api::V1::ItemSerializer
    end
  end
end
