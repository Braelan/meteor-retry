class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id, null: false
      t.string :uid, null: false
      t.string :provider, null: false

      t.timestamps null: false
    end
    add_index :authentications, :uid
    add_index :authentications, :provider
  end
end
