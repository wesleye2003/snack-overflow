class Question < ActiveRecord::Base
  validates :title, :body, :user_id, presence: true

end
