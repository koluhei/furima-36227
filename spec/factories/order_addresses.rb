FactoryBot.define do
  factory :order_address do
    postal_number {'123-4567'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {'あああ市'}
    address {'アイウエ1-1'}
    building {'あかさたなハイツ100号'}
    phone_number {'09011111111'}
  end
end
