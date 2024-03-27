FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Alphanumeric.alphanumeric(number: 8, min_numeric: 1) }
    password_confirmation { password }
    first_name            { 'ふがふが' }
    family_name           { 'ほげほげ' }
    first_name_kana       { 'フガフガ' }
    family_name_kana      { 'ホゲホゲ' }
    birthday              { Faker::Date.birthday }
  end
end


