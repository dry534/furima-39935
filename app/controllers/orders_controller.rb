class OrdersController < ApplicationController
  before_action :no_order, only: :index
  before_action :no_buy, only: :index
  before_action :find_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new
    no_order
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
       render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code,:prefecture_id,:city,:block,:building_name,:phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


 def no_order
  unless user_signed_in?
  redirect_to user_session_path
  end
 end

 def no_buy
  find_item
  if Item.exists?(id: @item) && BuyingHistory.where(item_id: @item).exists?
    redirect_to root_path
 end
end

 def find_item
  @item = Item.find(params[:item_id])
end

end
