FactoryBot.define do
  factory :user do
    nickname              {"yamada"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password}
    password_confirmation {password}
    family_name           {"yamada"}
    first_name            {"tarou"}
    family_name_kana      {"yamada"}
    first_name_kana       {"tarou"}
    birth_day             {"1990-01-01"}
  end
end