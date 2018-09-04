# frozen_string_literal: true

module Api
  module V1
    class OrderSerializer
      include FastJsonapi::ObjectSerializer

      set_type :orders
      set_id :id
      attributes :id, :user_id
      has_many :meals, serializer: Api::V1::MealSerializer
      belongs_to :user, serializer: Api::V1::UserSerializer
    end
  end
end
