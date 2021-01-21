class User < ApplicationRecord
  has_secure_password
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :password, confirmation: { case_sensitive: true }

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    self.save
  end

  private
  def generate_token
    SecureRandom.hex(10)
  end
end
