class CreateXusers < ActiveRecord::Migration
  def change
    create_table :xusers do |t|

      t.string   :zodiac
      t.string   :myers_briggs
      t.string   :crystal
      t.string   :potion
      t.string   :nsa_status
      t.string   :happiness
      t.string   :skills
      t.string   :concentrations
      t.string   :gender
      t.date     :birthday
      t.string   :favorite_food
      t.string   :favorite_island
      t.integer  :ski_size
      t.string   :state
      t.integer  :shoe_size
      t.integer  :pant_size
      t.integer  :shirt_size
      t.string   :myers_brigg
      t.string   :credit_score
      t.string   :hair_color
      t.string   :eye_color
      t.boolean  :forehead_wrinkles
      t.boolean  :marital_status
      t.string   :sexual_orientation
      t.integer :user_id
    end

  end
end
