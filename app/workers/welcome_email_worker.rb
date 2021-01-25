class WelcomeEmailWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    AdminMailer.with(user: user).welcome_email.deliver_now!
  end
end
