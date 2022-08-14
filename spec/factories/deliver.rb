FactoryBot.define do
    factory :deliver do
        payload_type { Faker::Name.first_name }
        total_items { Faker::Number.number(digits: 3) }
        total_billing { Faker::Number.decimal(l_digits: 2) }
        delivery_date { Faker::Date.between(from: '2022-01-01', to: '2022-12-30') }
    end
end