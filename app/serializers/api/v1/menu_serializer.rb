# frozen_string_literal: true

module Api
  module V1
    class MenuSerializer
      include FastJsonapi::ObjectSerializer

      set_type :menus

      attributes :created_at

      has_many :meals,  serializer: Api::V1::MealSerializer
      has_many :items,  serializer: Api::V1::ItemSerializer
    end
  end
end
