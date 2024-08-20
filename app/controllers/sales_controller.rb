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

  private

  def sale_params
    params.require(:sale).permit(:product_id, :quantity, :discount)
  end
end