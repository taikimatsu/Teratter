class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.integer :temple_id
      t.integer :user_id
      t.string :title
      t.text :body
      t.date :visit_date

      t.timestamps
    end
  end
end
