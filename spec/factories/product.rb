FactoryBot.define do
    factory :product do
        name { Faker::Name.first_name }
        price { Faker::Number.decimal(l_digits: 2) }
        unit { Faker::Name.suffix }
    end
end