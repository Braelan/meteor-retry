class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :status
      t.string :uid
      t.string :provider
      t.string :image_url

      t.timestamps null: false
    end
    add_index :users, :name
    add_index :users, :uid
  end
end
