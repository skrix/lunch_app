FactoryBot.define do
  factory :menu do
    trait :friday do
      created_at { '1999-09-10 00:00:00' }
    end
  end
end
