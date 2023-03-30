class User < ApplicationRecord

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.downcase.strip)

    if user && user.authenticate(password)
      user
    else
      nil
    end 
  end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

end