class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :code
      t.string :sku
      t.decimal :price
      t.integer :quantity
      t.string :uom

      t.timestamps
    end
  end
end
