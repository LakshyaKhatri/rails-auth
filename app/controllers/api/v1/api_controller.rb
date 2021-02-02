module Api
  module V1
    class ApiController < ActionController::API
      # Create a cookie instead and whenever the user returns
      # rails check if that cart persists in db and returns it.
      # If the cart is not present in db it will create a new
      # cart and overwrites the cookie.
      private
      def current_cart
        Cart.find_by(id:session[:cart_id])
      end

      def cart_required
        render_record_invalid("Cart doesn't exists yet.") unless current_cart.present?
      end

      def render_not_found()
        render json: { error: 'Resource not found.' }, status: :not_found
      end

      def render_record_invalid(errors)
        render json: { errors: errors }, status: :bad_request
      end

      def render_parameter_missing(exception)
        render json: { error: I18n.t('api.errors.missing_param') }, status: :unprocessable_entity
      end
    end
  end
end
