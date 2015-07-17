class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :content, null: false
      t.references :question
      t.timestamps null: false
    end
  end
end
