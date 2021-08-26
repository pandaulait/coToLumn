class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :parent_id
      t.integer :number
      t.text :body, null: false

      t.timestamps
    end
  end
end
