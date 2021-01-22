class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, limit: 100, null: false

      t.timestamps
    end
  end
end
