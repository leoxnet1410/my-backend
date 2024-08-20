class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.decimal :discount, default: 0
      t.timestamps
    end
  end
end
