FactoryBot.define do
    factory :adress do
        description { Faker::Name }
        zip_code { Faker::Internet.base64 }
    end
end