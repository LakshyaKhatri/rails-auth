class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      WelcomeEmailWorker.perform_async(@user.id)
      flash[:notice] = 'Signed Up successfully. Please login to continue.'
      redirect_to admin_login_url
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
