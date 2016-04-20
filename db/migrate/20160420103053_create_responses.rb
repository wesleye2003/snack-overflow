class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :body
      t.references :user
      t.references :respondable, polymorphic: true
      t.timestamps(null: false)
    end
  end
end
