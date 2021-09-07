class CreateWordEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :word_evaluations do |t|
      t.references :post
      t.string :entity
      t.float :score
      t.timestamps
    end
  end
end
