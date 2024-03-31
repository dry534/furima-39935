FactoryBot.define do
  factory :order do
    post_code      {'000-0000'}
    prefecture_id   {'2'}
    city            {'hogehoge'}
    block           {'hugahuga'}
    building_name   {''}
    phone_number    {'00000000000'}
    token           {'tk_*****************'}
  end
  
end
