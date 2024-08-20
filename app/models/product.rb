class Product < ApplicationRecord
  has_many :sales, dependent: :restrict_with_error
  
  validates :code, :name, :price, :quantity, :category, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end