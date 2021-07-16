FactoryBot.define do
  factory :item do
    name                {Faker::Name.initials(number: 4)}
    description         {Faker::Lorem.sentence}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    status_id           {Faker::Number.between(from: 2, to: 7)}    
    delivery_charge_id  {Faker::Number.between(from: 2, to: 3)}
    prefecture_id       {Faker::Number.between(from: 2, to: 48)}
    days_to_ship_id     {Faker::Number.between(from: 2, to: 4)}
    price               {Faker::Number.number(digits: 5)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
