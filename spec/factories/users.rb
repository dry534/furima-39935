FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Alphanumeric.alphanumeric(number: 6,min_numeric: 1)}
    password_confirmation {password}
    first_name            {Faker::Name.initials(number: 2)}
    family_name           {Faker::Name.initials(number: 2)}
    first_name_kana       {Faker::Name.initials(number: 2)}
    family_name_kana      {Faker::Name.initials(number: 2)}
    birthday              { Faker::Date.birthday }
  end
end