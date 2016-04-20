class CreateAnswers < ActiveRecord::Migration
  def change
  	create_table :answers do |t|
  		t.string   :body
  		t.integer  :user_id, :question_id

  		t.timestamps null: false
  	end
  end
end
