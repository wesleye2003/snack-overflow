class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.string   :title, :body
  		t.integer  :user_id
  	end
  end
end
