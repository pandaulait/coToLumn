class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.references :text, foreign_key: true
      t.references :problem, foreign_key: true
      t.integer :kind, null: false, default: 0

      t.timestamps
    end
  end
end
