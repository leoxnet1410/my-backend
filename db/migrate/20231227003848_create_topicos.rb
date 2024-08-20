class CreateTopicos < ActiveRecord::Migration[7.1]
  def change
    create_table :topicos do |t|
      t.references :tema
      t.string :description

      t.timestamps
    end
  end
end
