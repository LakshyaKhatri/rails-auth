module Api
  module V1
    class OrderItemsController < Api::V1::ApiController
      def index
        @order_items = OrderItem.where(order_id: params[:order_id])
      end

      def create
        cart_item = CartItem.find_by(id: params[:cart_item_id])
        return render_not_found unless cart_item.present?

        item = cart_item.item
        @order_item = OrderItem.new(
          item: item,
          qty: cart_item.qty,
          price: item.taxed_price,
          available: cart_item.qty <= item.in_stock,
          order: @order,
        )

        if @order_item.save
          cart_item.delete
        else
          render_record_invalid @order_item.errors
        end
      end
    end
  end
end
