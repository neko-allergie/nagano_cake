class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @order.postage = 800

    if @order.save
      @cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.quantity = cart.quantity
        order_detail.order_price = cart.item.without_tax + @order.postage
        order_detail.making_status = 0
        order_detail.save
      end

      current_customer.cart_items.destroy_all

      redirect_to complete_public_orders_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.pay_method = params[:order][:pay_method].to_i

    if params[:order][:address_number] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "1"
      deli_address = DeliAddress.find(params[:order][:address])
      @order.postcode = deli_address.postcode
      @order.address = deli_address.address
      @order.name = deli_address.name
    elsif params[:order][:address_number] == "2"
      deli_address_new = current_customer.deli_addresses.new(deli_address_params)
      render :new if !dell_address.save
    end

    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_order_price}

  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:name, :customer_id, :address, :pay_method, :postage, :postcode, :charge, :is_deleted)
  end
end