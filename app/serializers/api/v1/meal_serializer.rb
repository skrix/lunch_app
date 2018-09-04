# frozen_string_literal: true

module Api
  module V1
    class MealSerializer
      include FastJsonapi::ObjectSerializer

      attributes :id, :price, :item_id

      %w[name kind price].each do |item_method|
        attribute item_method.to_sym do |meal|
          meal.item.try(item_method.to_sym)
        end
      end

      belongs_to :item, serializer: Api::V1::ItemSerializer
    end
  end
end
