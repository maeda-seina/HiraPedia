class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :name, null: false
      t.text :body
      t.string :image_id
      t.float :latitude
      t.float :longitude
      t.text :access

      t.timestamps
    end
  end
end
