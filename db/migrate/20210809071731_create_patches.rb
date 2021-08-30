class CreatePatches < ActiveRecord::Migration[5.2]
  def change
    create_table :patches do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :text_id, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.string :image_id
      t.integer :status, null: false, default: 1
      t.timestamps
    end
  end
end
