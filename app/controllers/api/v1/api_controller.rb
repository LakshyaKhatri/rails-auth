module Api
  module V1
    class ApiController < ActionController::API
      private
      def render_not_found(exception)
        render json: { error: I18n.t('api.errors.not_found') }, status: :not_found
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
