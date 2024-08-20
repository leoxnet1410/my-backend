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
  # DELETE /products/:id
def destroy
  logger.debug "Sales exist?: #{@product.sales.exists?}"
  
  if @product.sales.exists?
    render json: { error: 'Cannot delete product with associated sales' }, status: :unprocessable_entity
  elsif @product.destroy
    head :no_content
  else
    render json: { error: 'Failed to delete product' }, status: :unprocessable_entity
  end
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
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Product not found' }, status: :not_found
  end
  def product_params
    params.require(:product).permit(:code, :name, :price, :category, :quantity, :description).tap do |whitelisted|
      whitelisted[:price] = whitelisted[:price].to_f # Asegúrate de convertir el precio a float
    end
  end
end