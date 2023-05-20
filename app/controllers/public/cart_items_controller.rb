class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: %i[increase decrease destroy]

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    increase_or_create(params[:cart_item][:item_id])
    redirect_to public_cart_items_path, notice: 'Successfully added product to your cart'
  end

  def increase
    @cart_item.increment!(:quantity, 1)
    redirect_to request.referer, notice: 'Successfully updated your cart'
  end

  def decrease
    decrease_or_destroy(@cart_item)
    redirect_to request.referer, notice: 'Successfully updated your cart'
  end

  def destroy
    @cart_item.destroy
    redirect_to request.referer, notice: 'Successfully deleted one cart item'
  end

  def destroy_all
  end

  def update
  end

  private

  def set_cart_item
    @cart_item = current_customer.cart_items.find(params[:id])
  end

  def increase_or_create(product_id)
    cart_item = current_customer.cart_items.find_by(item_id:)
    if cart_item
      cart_item.increment!(:quantity, 1)
    else
      current_customer.cart_items.build(item_id:).save
    end
  end

  def decrease_or_destroy(cart_item)
    if cart_item.quantity > 1
      cart_item.decrement!(:quantity, 1)
    else
      cart_item.destroy
    end
  end
end
