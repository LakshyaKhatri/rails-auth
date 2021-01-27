module Api
  module V1
    class ItemsController < Api::V1::ApiController

      def list
        @items = Item.where(category_id:params[:category]).order(:name)
        render json: @items
      end
    end
  end
end
