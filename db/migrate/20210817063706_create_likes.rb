class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :liked_content, polymorphic: true
      t.integer :category,null: false,default: 0

      t.timestamps
    end
  end
end
