class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  validate :unique_email?
  
  private
  def unique_email?
    if User.find_by email: 'ultron@ultron.com'
      errors.add(:email, "email already exists")
    end
  end
end
