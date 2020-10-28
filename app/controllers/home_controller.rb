class HomeController < ApplicationController
  def index
    puts get_user_session
    @products = LocationProduct.includes(:product).all;

  end

  def dashboard
    @orders = Order.sales_for_a_given_day(Time.now)

    @totaldaysales = @orders.sum(:total_amount)
    @averareorders = Order.average(:total_amount)
  end
end
