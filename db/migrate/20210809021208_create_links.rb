class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.references :text , null: false, foreign_key: true
      t.references :column , null: false, foreign_key: true

      t.timestamps
    end
  end
end
