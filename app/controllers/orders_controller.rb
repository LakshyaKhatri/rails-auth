class OrdersController < ApplicationController

  def show
    @order = Order.find_by(id: params[:id])

    unless @order.present?
      flash[:notice] = 'Order not created yet. Please checkout to create a new order.'
      redirect_to cart_index_url
    end
  end
end
