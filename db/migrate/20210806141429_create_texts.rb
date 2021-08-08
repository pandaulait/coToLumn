class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.string :image_id
      t.boolean :is_draft, null: false, default: 0

      t.timestamps
    end
  end
end
