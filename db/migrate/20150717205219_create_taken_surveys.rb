class CreateTakenSurveys < ActiveRecord::Migration
  def change
    create_table :taken_surveys do |t|

      t.timestamps null: false
    end
  end
end
