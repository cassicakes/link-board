class User < ActiveRecord::Base
  has_many :posts

  validates :email,
  presence: true,
  uniqueness: { case_sensitive: false },
  email: true
  
  validates :name,
  length: {maximum: 20},
  presence: true

  has_secure_password

  def self.authenticate(email, password)
    User.find_by_email(email).try(:authenticate, password)
  end

end