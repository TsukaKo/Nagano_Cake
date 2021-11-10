class Public::CartItemsController < ApplicationController
  # before_action :authenticate_customer!

  def create
  end

  def index
    binding.pry
    @cart_items = current_customer
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path(@cart_item.id)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    current_customer.cart_items.destroy_all
  end

end
