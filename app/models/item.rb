class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :load_style
  belongs_to :prefecture
  belongs_to :situation

  has_one_attached :image
  belongs_to :user
  has_one :buying_history

  validates :item_name, presence: true
  validates :detail, presence: true
  validates :price, presence: true,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
  validates :category_id, numericality: { other_than: 1 } 
  validates :situation_id, numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 
  validates :load_style_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :image, presence: true

  def empty?
    attributes.except('id', 'created_at', 'updated_at').all? { |_, v| v.nil? || v == '' }
  end

end
