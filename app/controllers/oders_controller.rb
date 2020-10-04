class OdersController < ApplicationController
  def create
    @oder = Oder.new
  end
end
