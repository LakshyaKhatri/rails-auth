module Api
  module V1
    class OrderController < Api::V1::ApiController
      #TODO: use filters to check cart presence everywhere
      def create
        cart = current_cart
        if Order.find_by(cart:cart).present?
          render_record_invalid "Order already present."
        else
          order_total = cart.cart_items.joins(:item).sum("items.taxed_price * cart_items.qty")
          order = Order.new(cart: cart, total: order_total)
          render_record_invalid order.errors unless order.save
        end
      end

    end
  end
end
