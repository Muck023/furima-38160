class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def move_to_index
    @item = Item.find(params[:item_id])
    @order = Order.where(item_id: params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @order.present?
  end

  def order_params
    params.require(:order_address).permit(:postcode, :region_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
