FactoryBot.define do
  factory :user_order do
    first_name      { Gimei.first.kanji }
    last_name       { Gimei.last.kanji  }
    post_code       { '123-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id   { Faker::Number.between(from: 1, to: 47) }
    address         { Gimei.city.kanji }
    building_number { Faker::Address.building_number }
    building_name   { Gimei.town.kanji }
    phone_number    { Faker::Number.leading_zero_number(digits: 11) }
    token           { Faker::Number.hexadecimal(digits: 10) }
  end
end
