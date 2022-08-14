FactoryBot.define do
    factory :employee do
        name { Faker::Name.name }
        employee_code { Faker::Internet.base64 }
    end
end