FactoryBot.define do
  factory :item do
    merchant
    name { Faker::Name.name }
    description { Faker::Movie.quote }
    unit_price { Faker::Number.number(digits: 3) }
  end
end
