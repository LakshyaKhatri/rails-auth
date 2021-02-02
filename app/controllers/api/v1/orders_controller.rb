module Api
  module V1
    class OrdersController < Api::V1::ApiController
      before_action :cart_required

      def create
        cart = current_cart

        order_total = cart.cart_items.joins(:item).sum("items.taxed_price * cart_items.qty")
        @order = Order.new(total: order_total, cart_id: cart.id)
        return render_record_invalid @order.errors unless @order.save

        @order.create_order_items
        render json: @order
      end

      def place
        @order = Order.find_by(id:params[:order_id])
        return render_not_found unless @order.present?
        unavailable = @order.order_items.joins(:item).where("order_items.qty >= items.in_stock").count(:id) > 0

        return render_record_invalid "Item not available" if unavailable
        current_cart.delete
        session[:cart_id] = nil
      end
    end
  end
end
