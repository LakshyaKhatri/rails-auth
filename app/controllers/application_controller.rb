class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    session[:user_id] = 2
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
