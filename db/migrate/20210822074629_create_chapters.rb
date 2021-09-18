class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      # t.references :subject_area, foreign_key: true
      t.references :textbook_list, foreign_key: true
      t.references :grade, foreign_key: true

      t.integer :number, null: false
      t.string :body, null: false
      # t.integer :section, null: false


      t.timestamps
    end
  end
end
