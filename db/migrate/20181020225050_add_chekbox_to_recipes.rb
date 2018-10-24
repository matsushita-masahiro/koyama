class AddChekboxToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :check_box, :integer
    add_column :recipes, :user_id, :integer
  end
end
