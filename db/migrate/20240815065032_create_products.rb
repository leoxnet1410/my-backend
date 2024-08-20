class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :image
      t.integer :units
      t.string :category
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
