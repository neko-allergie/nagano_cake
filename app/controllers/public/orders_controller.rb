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

      redirect_to orders_confirm_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def new
    @order = Order.new
  end

  def comfirm
    @order = Order.new(order_params)
    @order.pay_method = params[:order][:pay_method].to_i

    if params[:order][:address] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address] == "1"
      deli_address = DeliAddress.find(params[:order][:address])
      @order.postcode = deli_address.postcode
      @order.address = deli_address.address
      @order.name = deli_address.name
    elsif params[:order][:address] == "2"
      deli_address_new = current_customer.deli_addresses.new(deli_address_params)
      if deli_address_new.save
        @order.postcode = deli_address_new.postcode
        @order.address = deli_address_new.address
        @order.name = deli_address_new.name
      else
        render 'new'
      end
    end

    @cart_items = current_customer.cart_items.all
    @total = 0

    @cart_items.each do |cart_item|
      subtotal = cart_item.item.taxin_order_price * cart_item.quantity
      @total += subtotal
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:name, :customer_id, :address, :pay_method, :postage, :postcode, :charge)
  end
end