class ItemsController < ApplicationController
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    # binding.pry
    if @item.update(item_params)
      # binding.pry
       redirect_to root_path
    else
      render :edit
    end
  end

  # def destroy
  #   @item = Item.find(params[:id])
  #   @item.destroy
  #   redirect_to root_path
  # end

  # def move_to_index
  # redirect_to action: :index unless user_signed_in?
  # end

  private

  def item_params
    params.require(:item).permit(:name, :price, :item_text, :category_id, :delivery_source_id, :delivery_free_id, :product_condition_id, :estimated_delivery_id, :image).merge(user_id: current_user.id)
  end


end
