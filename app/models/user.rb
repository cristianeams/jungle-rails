class User < ActiveRecord::Base
  has_secure_password 
  has_many :reviews
  validates :name, presence: true
  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates_confirmation_of :password, message: 'should match confirmation'
end
