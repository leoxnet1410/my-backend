class Product < ApplicationRecord
  has_many :sales, dependent: :destroy
  has_one_attached :image

  validates :code, :name, :price, :quantity, :category, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  def image_url
    if self.image.attached?
      url = Rails.application.routes.url_helpers.rails_blob_url(self.image, only_path: true)
      puts "Generated Image URL: #{url}"
      return url
    end
  end

  def as_json(options = {})
    super(options.merge(methods: [:image_url]))
  end
end
