class SessionController < ApplicationController

  def login
    redirect_to root_url if logged_in?
  end

  def new
    @user = User.find_by(email: params[:email])

    if !@user.nil? and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :login
    end
  end
end
