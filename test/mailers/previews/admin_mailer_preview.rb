# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class AdminMailerPreview < ActionMailer::Preview
  def welcome_email
    AdminMailer.with(user: User.first).welcome_email
  end

  def reset_password_email
    AdminMailer.with(user: User.first).reset_password_email
  end
end
