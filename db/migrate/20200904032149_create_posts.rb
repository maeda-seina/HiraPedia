# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :image_id, null: false
      t.text :body
      t.string :address, null: false
      t.text :access
      t.float :latitude
      t.float :longitude
      t.integer :impressions_count, default: 0

      t.timestamps
    end
  end
end
