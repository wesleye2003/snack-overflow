class User < ActiveRecord::Base
  has_secure_password
  
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :responses


  validates :username, uniqueness: true, presence: true
  validates :password_digest, presence: true
end
