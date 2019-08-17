class CreateGoriyakus < ActiveRecord::Migration[5.2]
  def change
    create_table :goriyakus do |t|
      t.text :name

      t.timestamps
    end
  end
end
