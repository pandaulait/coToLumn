class CreateLiteratures < ActiveRecord::Migration[5.2]
  def change
    create_table :literatures do |t|
      t.references :subject, polymorphic: true, null: false
      t.string :author
      t.string :explanation
      t.string :document, null: false
      t.integer :status, null: false,default: 0
      
      t.timestamps
    end
  end
end
