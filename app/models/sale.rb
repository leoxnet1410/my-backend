class Sale < ApplicationRecord
  belongs_to :product
  
  validates :product_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end