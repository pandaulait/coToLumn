class CreateTextbookLists < ActiveRecord::Migration[5.2]
  def change
    create_table :textbook_lists do |t|
      t.references :subject_area, foreign_key: true
      t.string :title
      
      t.timestamps
    end
  end
end
