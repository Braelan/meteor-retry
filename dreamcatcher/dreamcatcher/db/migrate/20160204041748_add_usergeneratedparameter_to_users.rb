class AddUsergeneratedparameterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :favorite_food, :string
    add_column :users, :favorite_island, :string
    add_column :users, :ski_size, :integer
    add_column :users, :state, :string
    add_column :users, :shoe_size, :integer
    add_column :users, :pant_size, :integer
    add_column :users, :shirt_size, :integer
    add_column :users, :myers_brigg, :string
    add_column :users, :credit_score, :string
    add_column :users, :hair_color, :string
    add_column :users, :eye_color , :string
    add_column :users, :forehead_wrinkles, :boolean
    add_column :users, :marital_status, :boolean
    add_column :users, :sexual_orientation, :string
  end
end
