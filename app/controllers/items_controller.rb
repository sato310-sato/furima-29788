class ItemsController < ApplicationController
  # ロクインして言うなくもindexとshowは閲覧できる
  before_action :move_to_index, except: [:index, :show]
  def index
  end

  # 未ログインの場合indexへリダイレクト
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
