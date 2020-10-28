class CartController < ApplicationController
  def index

    @carts = Cart.active_cart.where("sessionid=:sessionid", sessionid:get_user_session)

  end

  def new
    @cart = Cart.new
    @cart.sessionid = get_user_session
  end

  def create
    @cart = Cart.new(cart_params)
    puts Time.new
    @cart.created_at=Time.new;
    @cart.updated_at=Time.new;
    if(@cart.save)
      redirect_to carts_path
    else
      render 'new'
    end
  end

  def addcart

    @locationProduct = LocationProduct.find(params[:id])
    @cart = Cart.where("location_product_id= :location_product_id and sessionid= :sessionid", location_product_id: params[:id],sessionid: get_user_session).first

    if @cart.nil?
      @cart = Cart.new(
          "location_product" => @locationProduct,
          "price" => @locationProduct.price,
          "quantity_delivered" => 0,
          "sessionid" => get_user_session,
          "quantity" => 1,
          )
    else
      @cart.quantity = ((@cart.quantity.nil?) ? 0 : @cart.quantity)+1
    end
    @cart.save

    @carts = Cart.active_cart.where("sessionid=:sessionid", sessionid: get_user_session)
    render partial: "homecart"
  end

  def homecart
    @carts = Cart.active_cart.where("sessionid=:sessionid", sessionid: get_user_session)
    render partial: 'homecart'
  end

  def destroyhomecart
    @cart = Cart.find(params[:id])
    @cart.destroy

    redirect_to home_path
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    redirect_to carts_path
  end

  def checkout
    ids=params[:selected_ids]
    @order_status = OrderStatus.find(1);
    @carts = Cart.find(ids);

    @order  = Order.create(
      "order_status"=>@order_status,
      "order_date"=>Time.new,
      "total_amount"=>@carts.map { |e| e.quantity * e.price }.reduce(:+),
      "discount_amount"=>@carts.map { |e| e.discount.nil? ? 0 : e.discount }.reduce(:+),
      "grand_total_amount"=>(@carts.map { |e| e.quantity * e.price }.reduce(:+))
    )

    @carts.each do |cart|
      CartOrder.create(
        "cart"=>cart,
        "order"=>@order
      )
      cart.isordered = true
      cart.save
    end

  end

  private

  def cart_params
    params.require(:cart).permit(:price, :quantity, :quantity_delivered, :discount, :sessionid, :location_product_id, :order_id, :selected_ids)
  end



end
