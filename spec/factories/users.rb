FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Alphanumeric.alphanumeric(number: 8, min_numeric: 1) }
    password_confirmation { password }
    first_name            { generate_full_width_character }
    family_name           { generate_full_width_character }
    first_name_kana       { generate_full_width_kana }
    family_name_kana      { generate_full_width_kana }
    birthday              { Faker::Date.birthday }
  end
end

def generate_full_width_character
  (0x3041..0x3096).to_a.pack('U*').chars.sample(5).join
end

def generate_full_width_kana
  (0x30A1..0x30F6).to_a.pack('U*').chars.sample(5).join
end