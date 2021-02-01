module Api
  module V1
    class CartController < Api::V1::ApiController
      def create
        return render_record_invalid "Cart already exists" if current_cart.present?

        @cart = Cart.new
        return render json: "Unable to create cart" unless @cart.save

        session[:cart_id] = @cart.id
        render json: {}, status: :created
      end
    end
  end
end
