module Api
  module V1
    class ItemsController < Api::V1::ApiController
      def list
        @items = Item.left_outer_joins(:cart_items).where(
          'items.category_id = ?', params[:category]
        ).distinct.select("items.*, cart_items.id as cart_item_id").group('items.id')

        render json: @items
      end
    end
  end
end
