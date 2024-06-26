class Order
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :city, :block, :building_name, :phone_number, :user_id, :item_id, :token, :price, :buying_history_id


  validates :post_code, :city, :block, :phone_number, :user_id, :item_id,:token, presence: true
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }


  def save
 order = BuyingHistory.create(item_id: item_id, user_id: user_id)
 Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number, buying_history_id: order.id)
  end

end
