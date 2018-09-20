class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit, :update, :create]

  def index
    @products = params[:cat] ? Product.where(category: params[:cat]) : Product.all
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

  def edit
  end

  def update
    respond_to do |format|
      @product.attributes = product_params
      if @product.save
        format.html {redirect_to root_path}
      else
        format.html {render :edit}
      end
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :quantity, :availability, :img_link, :category)
    end
end
