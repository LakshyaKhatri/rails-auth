class ResetPasswordEmailWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    AdminMailer.with(user: user).reset_password_email.deliver_now!
  end
end
