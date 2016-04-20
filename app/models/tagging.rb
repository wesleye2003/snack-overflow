class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :question
  # Remember to create a migration!
end
