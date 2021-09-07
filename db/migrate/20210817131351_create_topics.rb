class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.references :user, foreign_key: true
      t.boolean :question, null: false, default: false

      t.timestamps
    end
  end
end
