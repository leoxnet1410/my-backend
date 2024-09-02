class Customer < ApplicationRecord
    has_many :sales
    
    validates :nombre, presence: true
    validates :apellido, presence: true
   
  end