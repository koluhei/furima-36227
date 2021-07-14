FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::internet.free_email}
    password              {Faker::internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太朗"}
    l_kana                {"ヤマダ"}
    f_kana                {"タロウ"}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end