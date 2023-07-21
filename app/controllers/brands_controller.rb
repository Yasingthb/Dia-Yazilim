# app/controllers/brands_controller.rb
class BrandsController < ApplicationController
    before_action :find_brand, only: [:show, :edit, :update, :destroy]
  
    def index
      @brands = Brand.all
    end
  
    def show
    end
  
    def new
      @brand = Brand.new
    end
  
    def create
      @brand = Brand.new(brand_params)
      if @brand.save
        redirect_to Brand, notice: 'Marka başarıyla oluşturuldu.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @brand.update(brand_params)
        redirect_to Brand, notice: 'Marka başarıyla güncellendi.'
      else
        render :edit
      end
    end
  
    def destroy
      @brand = Brand.find(params[:id])
      if @brand.destroy
        redirect_to Brand, notice: 'Marka başarıyla silindi.'
      else
        Rails.logger.debug(@brand.errors.full_messages) # This will log any errors
        redirect_to brands_url, alert: 'Marka silinirken bir hata oluştu.'
      end
    end
    
  
    private
  
    def find_brand
      @brand = Brand.find(params[:id])
    end
  
    def brand_params
      params.require(:brand).permit(:name)
    end
  end
  