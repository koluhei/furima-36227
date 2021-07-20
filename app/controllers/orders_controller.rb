class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_jp
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end



  private

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_number, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_jp
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
