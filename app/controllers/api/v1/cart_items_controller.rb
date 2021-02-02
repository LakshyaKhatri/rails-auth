module Api
  module V1
    class CartItemsController < Api::V1::ApiController
      before_action :cart_required


      def index
        @cart_items = CartItem.where(cart_id: session[:cart_id])
        render json: @cart_items, only: [:id]
      end

      def show
        @cart_item = current_cart.cart_items.find_by(id: params[:id])
        return render json: @cart_item if @cart_item.present?
        render_not_found
      end

      def create
        @cart_item = CartItem.new(
          item_id: params[:item_id],
          qty: 1,
          cart: current_cart
        )
        return render_record_invalid cart_item.errors unless @cart_item.save
        render json: @cart_item, status: :created
      end

      def destroy
        #NOTE: could be done the other way arround too.
        @cart_item = current_cart.cart_items.find_by(id: params[:id])
        return render_not_found unless @cart_item.present?

        @cart_item.delete
        render json: {}, status: :no_content
      end

      def update
        # Work arround! (we should be getting qty in params instead)
        @cart_item = current_cart.cart_items.find_by(id: params[:id])
        return render_not_found unless @cart_item.present?

        @cart_item.qty += params[:qty].to_i
        return render_record_invalid @cart_item.errors unless @cart_item.save
        render json: { qty: @cart_item.qty }
      end
    end
  end
end
