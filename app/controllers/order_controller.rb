class OrderController < ApplicationController

  # Add filter to check cart existance
  def index
    @order = Order.find_by(cart_id: session[:cart_id])

    unless @order.present?
      flash[:notice] = 'Order not created yet. Please checkout to create a new order.'
      redirect_to cart_url
    end
  end
end
