# frozen_string_literal: true

class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :name, null: false
      t.text :body
      t.string :image_id
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :access
      t.integer :impressions_count, default: 0

      t.timestamps
    end
  end
end
