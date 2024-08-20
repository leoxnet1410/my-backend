class AddDiscountToSales < ActiveRecord::Migration[7.1]
  def change
    add_column :sales, :discount, :integer
  end
end
