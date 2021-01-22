class CreateAppliedTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :applied_taxes do |t|
      t.references :item, foreignkey: true, null:false
      t.references :tax, foreignkey: true, null: false

      t.timestamps
    end

    add_index :applied_taxes, [:item, :tax], unique: true
  end
end
