FactoryBot.define do
    factory :truck do
        board_number { Faker::Internet.base64 }
    end
end