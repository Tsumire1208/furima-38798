FactoryBot.define do
  factory :order_buyer do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { Gimei.city.kanji }
    address { Gimei.city.kanji }
    building { Faker::Address.street_name }
    phone { Faker::Number.between(from: 1_000_000_000, to: 99_999_999_999) }
    token { 'tok_' + Faker::Internet.password(min_length: 28, max_length: 28) }
  end
end
