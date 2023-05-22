class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders.latest
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
  end

  def new
    @order = Order.new
  end

  def confirm

  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:adress,:paymethod,:postage,:postcode,:charge)
  end

end

