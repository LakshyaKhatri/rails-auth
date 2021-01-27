class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :qty, null: false
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
