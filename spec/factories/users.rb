FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Faker::Name.initials(number: 2)}
    family_name           {Faker::Name.initials(number: 2)}
    first_name_kana       {Faker::Name.initials(number: 2)}
    family_name_kana      {Faker::Name.initials(number: 2)}
  end
end