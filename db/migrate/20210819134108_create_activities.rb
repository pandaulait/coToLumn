class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :target, polymorphic: true
      t.references :receiver, polymorphic: true
      t.integer :action_type, null: false
      t.boolean :read, null: false, default: false

      t.timestamps
    end
  end
end
