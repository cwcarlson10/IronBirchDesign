class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.delete
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :price)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
