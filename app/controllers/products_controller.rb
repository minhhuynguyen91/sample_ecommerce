class ProductsController < ApplicationController
  before_action :product, only: [:show]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html {redirect_to root_path}
      else
        format.html {render :new}
      end
    end
  end

  private
    def product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :quantity, :availability, :img_link)
    end
end
