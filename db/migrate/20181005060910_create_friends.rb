class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :user_id_rq
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
