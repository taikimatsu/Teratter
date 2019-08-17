class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.text :contact
      t.text :reply
      t.integer :user_id

      t.timestamps
    end
  end
end
