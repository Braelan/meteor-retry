class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :front
      t.string :front_img
      t.string :back
      t.string :back_img
      t.integer :recipient_id

      t.timestamps null: false
    end
    add_index :posts, :user_id
    add_index :posts, :recipient_id
  end
end
