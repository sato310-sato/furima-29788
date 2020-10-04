class ItemsController < ApplicationController
  before_action :item_tweet, only: [:edit, :show, :update, :destroy]
  # before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.order(created_at: :desc)
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  # def move_to_index
  # redirect_to action: :index unless user_signed_in?
  # end

  private

  def item_params
    params.require(:item).permit(:name, :price, :item_text, :category_id, :delivery_source_id, :delivery_free_id, :product_condition_id, :estimated_delivery_id, :image).merge(user_id: current_user.id)
  end

  def item_tweet
    @item = Item.find(params[:id])
  end
end
