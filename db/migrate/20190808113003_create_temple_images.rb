class CreateTempleImages < ActiveRecord::Migration[5.2]
  def change
    create_table :temple_images do |t|
      t.integer :temple_id
      t.string :image_id

      t.timestamps
    end
  end
end
