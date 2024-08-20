class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
  
    # GET /products
    def index
      @products = Product.all
      render json: @products
    end
  
    # GET /products/:id
    def show
      render json: @product
    end
  
    # POST /products
    def create
      @product = Product.new(product_params)
  
      if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /products/:id
    def destroy
      @product.destroy
      head :no_content
    end
  
    # PATCH/PUT /products/:id
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(:code, :name, :price, :category, :quantity, :description).tap do |whitelisted|
        whitelisted[:price] = whitelisted[:price].to_f # Asegúrate de convertir el precio a float
      end
    end
  end
  