class CreateOutSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :out_surveys do |t|
      t.integer :user_id
      t.integer :question_1
      t.integer :question_2

      t.timestamps
    end
  end
end
