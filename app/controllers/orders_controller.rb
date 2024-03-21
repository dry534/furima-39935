class OrdersController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new
    @item = Item.find(params[:item_id])
    noedit
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    binding.pry
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
    params.require(:order).permit(:post_code,:prefecture_id,:city,:block,:building_name,:phone_number, :price).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

private
def noedit
  if user_signed_in? && current_user == Item.find(params[:item_id]).user
  redirect_to root_path
  end
 end



end
