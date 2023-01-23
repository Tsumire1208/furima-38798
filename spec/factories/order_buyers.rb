FactoryBot.define do
  factory :order_buyer do

    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { Gimei.city.kanji }
    address { Gimei.city.kanji }
    building { Faker::Address.street_name }
    phone { Faker::Number.between(from: 1000000000, to: 99999999999) }
  end
end
