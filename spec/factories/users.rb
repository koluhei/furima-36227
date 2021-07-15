FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 8, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太朗"}
    l_kana                {"ヤマダ"}
    f_kana                {"タロウ"}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end