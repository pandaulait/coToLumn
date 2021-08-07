class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.integer :user_id, null: false
      t.string :title, nill: false
      t.text :body, nill: false
      t.string :image_id
      t.boolean :is_draft, nill: false, default: 

      t.timestamps
    end
  end
end
