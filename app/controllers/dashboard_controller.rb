class DashboardController < ApplicationController

  def index
    redirect_to login_url if !logged_in?
    @users = User.all
  end
end
