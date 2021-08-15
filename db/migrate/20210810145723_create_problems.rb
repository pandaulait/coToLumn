class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.references :author, polymorphic: true
      t.text :body, null: false
      t.text :answer, null: false
      t.text :commentary
      t.integer :subject_status, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
