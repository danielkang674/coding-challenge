class RemoveCommentIdFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :comment_id, :integer
  end
end
