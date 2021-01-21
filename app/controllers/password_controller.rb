class PasswordController < ApplicationController
  def forgot
  end

  def create_reset_token
    user = User.find_by(email: params[:email])

    if user.present?
      user.generate_password_token!
      UserMailer.with(user: user).reset_password_email.deliver_now
      @info = 'We have emailed you a reset password link. The link will expire after 2 minutes.'
      render :forgot
    else
      @error = "No user registered with this email!"
      render :forgot
    end
  end

  def reset
  end
end
