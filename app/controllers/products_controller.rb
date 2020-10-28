class ProductsController < ApplicationController
  def index
    @products = Product.all;
  end

  def show
    if !params[:id].blank? && !params[:id]=='new'
       @products = Product.find(params[:id]);
    end
  end

  def edit
    @product = Product.find(params[:id]);
  end


  def new
    @product = Product.new;
  end

  def create
    @product = Product.new(product_params)
    if(@product.save)
      redirect_to products_path
    else
      render 'new'
    end
    #render plain: params[:article].inspect
  end


  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path formats :html
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    #redirect_to product_path
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :code, :sku, :price, :quantity, :image)
  end

end
