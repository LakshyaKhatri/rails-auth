class AdminMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Admin Dashboard')
  end

  def reset_password_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Password Recovery | Admin Dashboard')
  end
end
