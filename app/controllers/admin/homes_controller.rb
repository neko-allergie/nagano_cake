class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).per(8)
  end
end
