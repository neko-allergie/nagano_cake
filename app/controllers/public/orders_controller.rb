class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :cart_check, only: [:new, :confirm, :create]

  def cart_check
    unless current_customer.cart_items.exists?
    flash[:notice] = "カートに商品がありません"
    redirect_to public_cart_items_path
    end
  end

  def index
    @orders = current_customer.orders.page(params[:page]).per(8)
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
      create_order_details
      current_customer.cart_items.destroy_all
      redirect_to complete_public_orders_path
    else
      render :new
    end
  end

  def new
    @order = Order.new
    @customer_address = DeliAddress.where(customer_id: current_customer.id)
  end

  def confirm
    build_order_from_params
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:name, :customer_id, :address, :pay_method, :postage, :postcode, :charge, :is_deleted)
  end

  def deli_address_params
    params.require(:order).permit(:name, :address, :postcode)
  end

  def create_order_details
    @cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.item_id = cart.item_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart.quantity
      order_detail.order_price = cart.item.without_tax + @order.postage
      order_detail.making_status = 0
      order_detail.save
    end
  end

  def build_order_from_params
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "2"
      deli_address = DeliAddress.where(params[:order][:address_id])
      @order.postcode = deli_address.postcode
      @order.address = deli_address.address
      @order.name = deli_address.name
    elsif params[:order][:address_number] == "3"
      deli_address_new = current_customer.deli_addresses.build(deli_address_params)
      unless @order.valid?
      flash[:error] = "注文情報が正しくありません。修正してください。"
      render :new
      return
      end
    else
      #どの配達先ボタンも選ばなかった場合の処理
      unless @order.valid?
      flash[:error] = "注文情報が正しくありません。修正してください。"
      render :new
      return
      end
    end
    @cart_items = current_customer.cart_items.all
    @total = calculate_total_price
    flash[:error] = ""
    render :confirm
  end

  def calculate_total_price
    @cart_items.inject(0) { |sum, item| sum + item.sum_of_order_price }
  end
end