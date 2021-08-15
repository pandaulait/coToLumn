class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :article, polymorphic: true
      t.references :speaker, polymorphic: true
      t.string :body, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
