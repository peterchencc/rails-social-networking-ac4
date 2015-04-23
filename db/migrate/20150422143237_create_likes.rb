class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :photo_id

      t.timestamps null: false
    end

    add_index :likes, :photo_id
    add_index :likes, :user_id
  end
end
