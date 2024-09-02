class SalesController < ApplicationController
  def create
    sale = Sale.new(sale_params)

    if sale.save
    
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
    sales = Sale.includes(:product, :customer).all
  
    sales_with_product_details = sales.map do |sale|
      total = sale.quantity * sale.product.price - sale.discount  
  
      {
        id: sale.id,
        product_code: sale.product.code,
        name: sale.product.name,
        price: sale.product.price,
        category: sale.product.category,
        description: sale.product.description,
        quantity: sale.quantity,
        total: total > 0 ? total : 0,  
        discount: sale.discount,  
        customer_name: sale.customer ? "#{sale.customer.nombre} #{sale.customer.apellido}" : "No asociado",
        created_at: sale.created_at
      }
    end
  
    render json: sales_with_product_details, status: :ok
  end

  private

  def sale_params
    params.require(:sale).permit(:product_id, :quantity, :discount, :customer_id)
  end
end
