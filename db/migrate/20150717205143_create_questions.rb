class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :name, null: false
      t.text :possible_values
      t.references :survey
      t.timestamps null: false
    end
  end
end
