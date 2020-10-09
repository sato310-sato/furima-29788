class OrdersController < ApplicationController
  before_action :item_tweet, only: [:index, :create]

  def index
  end

  def create
    @price = UserPrice.new(price_params)
    if @price.valid?
      pay_item
      @price.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def item_tweet
    @item = Item.find(params[:item_id])
  end

  def price_params
    params.permit(:postal_code, :prefectural_id, :city, :house_number, :building, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: price_params[:token],
      currency: 'jpy'
    )
  end
end
