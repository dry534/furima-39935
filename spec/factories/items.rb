FactoryBot.define do
  factory :item do
    item_name             { 'test' }
    detail                { 'test用の説明文です' }
    price                 { '5000' }
    situation_id              { '2' }
    delivery_day_id              { '2' }
    load_style_id              { '2' }
    category_id              { '2' }
    prefecture_id              { '2' }
  end
end
