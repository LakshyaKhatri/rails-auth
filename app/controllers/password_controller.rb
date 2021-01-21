class PasswordController < ApplicationController
  def forgot
  end

  def create_reset_token
    user = User.find_by(email: params[:email])

    if user.present?
      user.generate_password_token!
      UserMailer.with(user: user).reset_password_email.deliver_now
      flash[:notice] = 'E-mail sent with password reset instructions.'
      redirect_to login_url
    else
      @error = "No user registered with this email!"
      render :forgot
    end
  end

  def reset
    @user = User.find_by(reset_password_token: params[:token])

    unless @user.present? or @user.password_token_valid?
      flash[:notice] = 'Link expired. Please generate a new link.'
      redirect_to login_url
    end
  end

  def change_password
    if @user.update(user_params)
      flash[:notice] = 'Password reset successful. Login again using your new password.'
      redirect_to login_url
    else
      render :reset
    end
  end


  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
