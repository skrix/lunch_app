# frozen_string_literal: true

module Meals
  class Create < ::Callable
    def initialize(params = {})
      @meal_params = params.fetch(:meal_params, {})
    end

    def call
      Meal.create(meal_params)
    end

    private

    attr_reader :meal_params
  end
end
