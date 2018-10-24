class CreateCheckBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :check_boxes do |t|
      t.integer :user_id
      t.integer :check_box
      t.integer :recipe_id

      t.timestamps
    end
  end
end
