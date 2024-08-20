class CompanyController < ApplicationController
    def index
      companies = Company.all
      render json: companies
    end
  
    def create
      company = Company.new(company_params)
      if company.save
        render json: company, status: :created
      else
        render json: company.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def company_params
      params.require(:company).permit(:name)
    end
  end