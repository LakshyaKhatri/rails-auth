module Api
  module V1
    class CartController < Api::V1::ApiController
      def add_item
        create_cart unless current_cart.present?
        cart_item = CartItem.new(
          item_id: params[:item_id],
          qty: params[:item_id],
          cart: current_cart
        )

        if cart_item.save
          render json: {}, status: :ok
        else
          render_record_invalid cart_item
        end
      end

      private
      def current_cart
        Cart.find_by(id:session[:cart_id])
      end

      def create_cart
        cart = Cart.new
        if cart.save
          session[:cart_id] = cart.id
        end
        #TODO: Do something if db connection is not established.
      end

      def cart_item_params
        params.require(:cart_item).permit(:item_id, :qty)
      end
    end
  end
end
