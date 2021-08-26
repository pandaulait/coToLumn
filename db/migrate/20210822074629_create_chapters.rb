class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.references :text, foreign_key: true
      t.integer :body, null: false
      t.integer :section, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
