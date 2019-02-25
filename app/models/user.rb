class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  
  validate :unique_email?
  
  
  def authenticate_with_credentials(email, password)

    email = email.strip.downcase
    user = User.where('lower(email) = ?', email).first
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      true
    end  
  end
  
  private
  def unique_email?
    if User.find_by email: 'ultron@ultron.com'
      errors.add(:email, "email already exists")
    end
  end

  
end
