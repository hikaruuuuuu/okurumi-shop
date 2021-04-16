FactoryBot.define do
  factory :user do

    password = '1a' + Faker::Internet.password(min_length: 5, max_length: 20)

    name                  { Faker::Internet.username }
    email                 { Faker::Internet.email }
    password              { password }
    password_confirmation {password}

  end
end
