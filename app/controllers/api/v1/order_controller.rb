module Api
  module V1
    class OrderController < Api::V1::ApiController
      before_action :cart_required

      def create
        cart = current_cart

        order_total = cart.cart_items.joins(:item).sum("items.taxed_price * cart_items.qty")
        @order = Order.new(total: order_total, cart: cart)
        return render_record_invalid @order.errors unless @order.save

        @order.create_order_items(cart)
        render json: @order
      end
    end
  end
end
