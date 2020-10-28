class LocationsController < ApplicationController
  def index
    @products= LocationInventory.selling_products;
  end
end
