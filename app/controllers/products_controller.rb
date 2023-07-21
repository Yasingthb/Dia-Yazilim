# app/controllers/products_controller.rb
class ProductsController < ApplicationController
    before_action :find_product, only: [:show, :edit, :update, :destroy]
  
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
      if @product.save
        redirect_to products_path, notice: 'Ürün başarıyla oluşturuldu.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @product.update(product_params)
        redirect_to products_path, notice: 'Ürün başarıyla güncellendi.'
      else
        render :edit
      end
    end
  
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path, notice: 'Ürün başarıyla silindi.'
    end
  
    private
  
    def find_product
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(:name, :description, :brand_id)
    end
end
  