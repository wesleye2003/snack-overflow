class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :questions, through: :taggings
  # Remember to create a migration!
  validates :tag_name, presence: true
end
