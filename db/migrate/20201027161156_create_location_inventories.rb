class CreateLocationInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :location_inventories do |t|
      t.references :location, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :quantity_available
      t.decimal :cost
      t.decimal :selling_price

      t.timestamps
    end
  end
end
