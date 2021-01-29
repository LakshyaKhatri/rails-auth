class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references :order

      t.timestamps
    end

    add_index :carts, :order, unique: true
  end
end
