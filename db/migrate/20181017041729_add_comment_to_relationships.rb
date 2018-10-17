class AddCommentToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :comment, :text
  end
end
