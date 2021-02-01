module Api
  module V1
    class OrderController < Api::V1::ApiController
      def create
        cart = current_cart

        order_total = cart.cart_items.joins(:item).sum("items.taxed_price * cart_items.qty")
        @order = Order.new(total: order_total)
        return render_record_invalid order.errors unless @order.save

        render json: @order
      end
    end
  end
end
