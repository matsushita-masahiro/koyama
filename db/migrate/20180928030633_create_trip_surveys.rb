class CreateTripSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_surveys do |t|
      t.integer :user_id
      t.integer :question_1
      t.integer :question_2

      t.timestamps
    end
  end
end
