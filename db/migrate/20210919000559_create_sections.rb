class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.references :chapter, foreign_key: true
      t.references :text, foreign_key: true
      t.integer :number, null: false


      t.timestamps
    end
  end
end
