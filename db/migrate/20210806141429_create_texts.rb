class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.integer :admin_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.string :image_id
      t.boolean :published, null: false, default: true

      t.timestamps
    end
  end
end
