class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :order_status, null: false, foreign_key: true
      t.datetime :order_date
      t.decimal :total_amount
      t.decimal :discount_amount
      t.decimal :grand_total_amount

      t.timestamps
    end
  end
end
