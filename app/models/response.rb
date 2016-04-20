class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :respondable, polymorphic: true
  has_many :votes, as: :votable
end
