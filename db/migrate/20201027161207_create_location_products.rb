class CreateLocationProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :location_products do |t|
      t.references :location, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :quantity_available
      t.decimal :average_cost
      t.decimal :price
      t.decimal :discount
      t.string :uom

      t.timestamps
    end
  end
end
