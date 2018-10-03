class ChangeDatatypeTitle < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :category, :string
    change_column :likes, :user_id, :integer
  end
end
