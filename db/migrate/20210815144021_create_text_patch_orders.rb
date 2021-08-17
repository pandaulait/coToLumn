class CreateTextPatchOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :text_patch_orders do |t|
      t.references :patch, foreign_key: true
      t.references :content, polymorphic: true
      t.integer :order

      t.timestamps
    end
  end
end
