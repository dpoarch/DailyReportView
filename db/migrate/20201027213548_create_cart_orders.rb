class CreateCartOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_orders do |t|
      t.references :order, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
