class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
    render json: @products.as_json(methods: [:image_url])
  end

  # GET /products/:id
  def show
    render json: @product.as_json(methods: [:image_url])
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product.as_json(methods: [:image_url]), status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      render json: @product.as_json(methods: [:image_url])
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id
  def destroy
    if @product.sales.destroy_all && @product.destroy
      render json: { message: 'Product and associated sales deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete product and associated sales' }, status: :unprocessable_entity
    end
  end

  private

  # Método para encontrar el producto por ID
  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Product not found' }, status: :not_found
  end

  # Método para permitir solo los parámetros específicos
  def product_params
    params.require(:product).permit(:code, :name, :price, :category, :quantity, :description, :image).tap do |whitelisted|
      whitelisted[:price] = whitelisted[:price].to_f # Asegúrate de convertir el precio a float
    end
  end
end