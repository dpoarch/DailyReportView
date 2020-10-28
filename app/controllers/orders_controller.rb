class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:order_status).all()
  end

  def fulfillorder
    @order = Order.find(params[:id])
    if !@order.nil?
      @order.order_status_id = @order.order_status_id == 1? 2 : 1;
      @order.save
    end
  end
end
