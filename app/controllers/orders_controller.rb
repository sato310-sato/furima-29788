class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_tweet, only: [:index, :create]
  before_action :login_user
  before_action :sold_out

  def index
    @price = UserPrice.new
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

  def login_user
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

  def sold_out
    redirect_to root_path unless @item.order.nil?
  end
end
