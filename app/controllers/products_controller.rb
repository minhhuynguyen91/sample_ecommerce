class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit, :update, :create]

  def index
    if params[:barcode]
      @products = Product.search(params[:barcode])
    elsif params[:cat]
      @products = Product.where(category: params[:cat]) 
    else
      @products = Product.all
    end
  end

  def show
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    @markdown = Redcarpet::Markdown.new(renderer, autolink: true)
    # markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
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
