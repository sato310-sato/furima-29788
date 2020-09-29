class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.order(created_at: :desc)
  end

  # def move_to_index
    # redirect_to action: :index unless user_signed_in?
  # end
end
