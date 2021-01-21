class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Dashboard')
  end

  def reset_password_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Password Recovery | Dashboard')
  end
end
