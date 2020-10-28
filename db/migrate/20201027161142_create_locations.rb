class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :description
      t.string :address
      t.references :location_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
