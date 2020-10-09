class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_tweet, only: [:edit, :show, :update, :destroy]

  def index
    @item = Item.includes(:user).order(created_at: :desc)
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
    if @item.destroy && current_user == @item.user
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :item_text, :category_id, :delivery_source_id, :delivery_free_id, :product_condition_id, :estimated_delivery_id, :image).merge(user_id: current_user.id)
  end

  def item_tweet
    @item = Item.find(params[:id])
  end
  
end
