class ChangeColumnToFriends < ActiveRecord::Migration[5.2]
  def change
    rename_column :friends, :user_id_rq, :follower
    rename_column :friends, :user_id, :followed
  end
end
