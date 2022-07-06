class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @order = Order.where(item_id: @item.id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @order = Order.where(item_id: @item.id)
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id && @order.blank?
  end

  def item_params
    params.require(:item).permit(:image, :product, :message, :category_id, :status_id, :defrayment_id, :region_id, :reach_id,
                                 :price).merge(user_id: current_user.id)
  end
end
