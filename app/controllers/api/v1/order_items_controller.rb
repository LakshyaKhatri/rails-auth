module Api
  module V1
    class OrderItemsController < Api::V1::ApiController
      def index
        @order_items = OrderItem.where(
          order_id: params[:order_id]
        ).with_availability
      end
    end
  end
end
