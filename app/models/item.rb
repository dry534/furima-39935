class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categoty

  validates :item_name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :situation_id, numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 
  validates :load_style_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 

end
