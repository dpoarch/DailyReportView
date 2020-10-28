class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.string :sessionid
      t.references :location_product, null: false, foreign_key: true
      t.decimal :price
      t.integer :quantity
      t.integer :quantity_delivered
      t.decimal :discount

      t.timestamps
    end
  end
end
