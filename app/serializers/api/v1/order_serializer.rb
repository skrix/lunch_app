# frozen_string_literal: true

module Api
  module V1
    class OrderSerializer
      include FastJsonapi::ObjectSerializer

      set_type :orders

      attributes :id, :user_id

      has_many :meals,  serializer: Api::V1::MealSerializer
      has_many :items,  serializer: Api::V1::ItemSerializer
      belongs_to :user, serializer: Api::V1::UserSerializer
    end
  end
end
