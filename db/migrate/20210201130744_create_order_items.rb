class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :qty
      t.float :price
      t.references :order, null: false, foreign_key: true
      t.boolean :available

      t.timestamps
    end

    add_index :order_items, [:item_id, :order_id], unique: true
  end
end
