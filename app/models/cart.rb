class Cart < ApplicationRecord
  belongs_to :location_product

  scope :active_cart, -> {includes(:location_product).where("carts.isordered is null or carts.isordered = false") }

end
