class CartController < ApplicationController
  def index
    @cart_items = CartItem.where(cart_id: session[:cart_id]).order(:name)
  end
end
