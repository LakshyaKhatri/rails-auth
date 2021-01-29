class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :total, null: false
      t.references :cart, null: false

      t.timestamps
    end

    add_index :orders, :cart, unique: true
  end
end
