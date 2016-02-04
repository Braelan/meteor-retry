class RemoveRecipientIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :recipient_id, :integer
  end
end
