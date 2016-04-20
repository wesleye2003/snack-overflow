class Question < ActiveRecord::Base
	belongs_to :user
	has_many :votes, as: :votable
	has_many :responses, as: :respondable
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :answers

  validates :title, :body, :user_id, presence: true

  def total_points
  	self.votes.sum(:value)
  end

  def add_tags(string_of_tags)
  	tag_array = string_of_tags.split(" ")
  	tag_array.each { |tag| self.tags.create(tag_name: tag) }
  end
  ###########METHOD TO DETERMINE PRIMARY TAGGING?################
end
