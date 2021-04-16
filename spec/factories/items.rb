FactoryBot.define do
  factory :item do
    name         { Faker::Lorem.word }
    description  { Faker::Lorem.paragraph }
    price        { Faker::Number.between(from: 1, to: 9999999) }

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.png')
    end
  end
end
