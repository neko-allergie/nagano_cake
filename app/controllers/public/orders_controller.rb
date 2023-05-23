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
    @order.postage = 800
     if @order.save
       @cart_items = CartItem.where(customer_id: current_customer.id)
       @cart_items.each do |cart|
         order_detail = OrderDetail.new
         order_detail.item_id = cart.item_id
         order_detail.order_id = @order.id
         order_detail.quantity = cart.quantity
         order_detail.order_price = cart.item.without_tax+@order.postage
         order_detail.making_status = 0
         order_detail.save
       end
       cart_items.destroy.all
       redirect_to orders_confirm_path
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
       DeliAddress.find(params[:order][:address])

    elsif params[:order][:address_number] == "2"
      @deli_address = DeliAddress.new
      @deli_address.address = params[:order][:address]
      @deli_address.name = params[:order][:name]
      @deli_address.postcode = params[:order][:postcode]
      @deli_address.customer_id = current_customer.id

      if @deli_address.save
      @order.postcode = @deli_address.postcode
      @order.name = @deli_address.name
      @order.address = @deli_address.address
      else
       render 'new'
      end

      @cart_items = current_customer.cart_items.all
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:adress,:pay_method,:postage,:postcode,:charge)
  end

  def deli_address_params
    params.require(:deli_address).permit(:adress,:name,:postcode,:customer_id)
  end


end

