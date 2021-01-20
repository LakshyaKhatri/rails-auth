class ApplicationController < ActionController::Base

  def current_user
    User.find(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
