class CustomersController < ApplicationController
    # GET /customers
    def index
      @customers = Customer.all
      render json: @customers
    end
  
    # POST /customers
    def create
      @customer = Customer.new(customer_params)
      if @customer.save
        render json: @customer, status: :created
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /customers/:id
    def update
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        render json: @customer
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /customers/:id
    def destroy
      @customer = Customer.find(params[:id])
      if @customer.destroy
        head :no_content
      else
        render json: { error: 'Failed to delete customer' }, status: :unprocessable_entity
      end
    end
  
    private
  
    def customer_params
      params.require(:customer).permit(:nombre, :apellido, :telefono, :ubicacion)
    end
  end