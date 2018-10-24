class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :ingredient
      t.string :amount
      t.string :prepare
      t.string :breakdown
      t.string :menu_title

      t.timestamps
    end
  end
end
