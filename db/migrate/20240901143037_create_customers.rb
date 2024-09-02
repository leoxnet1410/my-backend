class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :nombre
      t.string :apellido
      t.string :telefono
      t.string :ubicacion

      t.timestamps
    end
  end
end
