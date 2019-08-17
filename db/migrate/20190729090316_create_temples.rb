class CreateTemples < ActiveRecord::Migration[5.2]
  def change
    create_table :temples do |t|
      t.text :name
      t.text :mainimage_id
      t.integer :prefecture_id
      t.integer :goriyaku_id
      t.text :address
      t.integer :area, default: 1, null: false, limit:8
      t.float :latitude
      t.float :longitude
      t.integer :week

      t.timestamps
    end
  end
end
