# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    after(:build) do |menu|
      Item.kinds.values
        .each { |kind| menu.meals << build(:meal, kind.to_sym) }
    end
  end
end
