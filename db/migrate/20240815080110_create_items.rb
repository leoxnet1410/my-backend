class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.decimal :price
      t.string :category
      t.integer :quantity

      t.timestamps
    end
  end
end
