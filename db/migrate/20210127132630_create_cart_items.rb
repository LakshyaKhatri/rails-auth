class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :qty, null: false
      t.references :cart, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end

    add_index :cart_items, [:item_id, :cart_id], unique: true
  end
end
