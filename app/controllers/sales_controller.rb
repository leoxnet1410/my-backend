class SalesController < ApplicationController
  def create
    sale = Sale.new(sale_params)
    
    if sale.save
      # Descontar la cantidad vendida del producto
      product = sale.product
      product.quantity -= sale.quantity
      if product.save
        render json: sale, status: :created
      else
        render json: product.errors, status: :unprocessable_entity
      end
    else
      render json: sale.errors, status: :unprocessable_entity
    end
  end

  def index
    sales = Sale.includes(:product).all
  
    sales_with_product_details = sales.map do |sale|
      {
        id: sale.id,
        product_code: sale.product.code,
        name: sale.product.name,
        price: sale.product.price,
        category: sale.product.category,
        description: sale.product.description,
        quantity: sale.quantity,
        total: (sale.quantity * sale.product.price * (1 - sale.discount / 100)),
        created_at: sale.created_at
      }
    end
  
    render json: sales_with_product_details, status: :ok
  end

  private

  def sale_params
    params.require(:sale).permit(:product_id, :quantity, :discount)
  end
end
