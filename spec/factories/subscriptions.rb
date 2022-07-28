FactoryBot.define do
  factory :subscription do
    title { Faker::Tea.type }
    price { Faker::Number.decimal(l_digits: 2) }
    status { ["pending", "active", "inactive"].sample }
    frequency { ["weekly", "monthly", "quarterly"].sample }
    tea { nil }
    customer { nil }
  end
end
