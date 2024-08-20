class CreateTemas < ActiveRecord::Migration[7.1]
  def change
    create_table :temas do |t|
    t.string :titulo
    t.string :image_url
    
      t.timestamps
    end
  end
end
