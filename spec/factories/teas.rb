FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature { Faker::Number.within(range: 100.0..120.0) }
    brew_time { Faker::Number.within(range: 1..10) }
  end
end
