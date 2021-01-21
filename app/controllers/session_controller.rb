class SessionController < ApplicationController

  def login
    redirect_to root_url if logged_in?
  end

  def new
    @user = User.find_by(email: params[:email])

    if @user.present? and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url
    else
      @error = "Invalid email or password!"
      render :login
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to login_url
  end
end
