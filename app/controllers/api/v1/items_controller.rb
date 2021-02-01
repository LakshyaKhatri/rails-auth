module Api
  module V1
    class ItemsController < Api::V1::ApiController
      def index
        @items = Item.with_cart_item_ids(params[:category])

        render json: @items
      end
    end
  end
end
