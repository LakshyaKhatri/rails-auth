class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.integer :in_stock, null: false
      t.float :taxed_price, null: false
      t.boolean :is_imported, null: false
      t.references :category, foreignkey: true

      t.timestamps
    end
  end
end
