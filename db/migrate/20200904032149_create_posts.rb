class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :favorite_id, null: false
      t.integer :post_comment_id, null: false
      t.string :title, null: false
      t.text :body
      t.string :address, null: false
      t.text :access
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
