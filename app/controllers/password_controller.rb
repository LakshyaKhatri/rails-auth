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
  end
end
