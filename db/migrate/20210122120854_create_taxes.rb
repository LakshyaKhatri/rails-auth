class CreateTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.string :name,  limit: 100, null: false
      t.float :rate, null: false

      t.timestamps
    end
  end
end
