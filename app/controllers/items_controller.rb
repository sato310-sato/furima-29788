class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def move_to_index
  # redirect_to action: :index unless user_signed_in?
  # end

  private

  def item_params
    params.require(:item).permit(:name, :price, :item_text, :category_id, :delivery_free_id, :product_condition_id, :estimated_delivery_id, :uer_id)
  end
end
