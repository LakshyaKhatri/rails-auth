class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  private
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    redirect_to admin_login_url unless logged_in?
  end
end
