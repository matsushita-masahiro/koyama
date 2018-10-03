class DeleteTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :etc_surveys
    drop_table :health_surveys
    drop_table :learning_surveys
    drop_table :life_surveys
    drop_table :out_surveys
    drop_table :trip_surveys
  end
end
