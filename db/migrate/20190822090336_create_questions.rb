class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :user_id
      t.integer :impressions_count, default: 0

      t.timestamps
    end
  end
end
