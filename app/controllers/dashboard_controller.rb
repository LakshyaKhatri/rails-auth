class DashboardController < ApplicationController

  def index
    redirect_to login_url if !logged_in?
  end
end
