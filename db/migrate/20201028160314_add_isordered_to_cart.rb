class AddIsorderedToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :isordered, :boolean
  end
end
