class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	has_many :responses, as: :respondable
	has_many :votes, as: :votable
  validates :body, :user_id, :question_id, presence: true

  def total_points
  	self.votes.sum(:value)
  end
end
