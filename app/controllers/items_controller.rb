class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
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

  private

  def item_params
    params.require(:item).permit(:image, :product, :message, :category_id, :status_id, :defrayment_id, :region_id, :reach_id,
                                 :price).merge(user_id: current_user.id)
  end
end
