class AddCustomerIdToSales < ActiveRecord::Migration[7.1]
  def change
    add_reference :sales, :customer, foreign_key: true
  end
end
