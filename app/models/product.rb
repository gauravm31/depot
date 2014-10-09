class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(png|jpg|gif)\Z}i,
    message: 'Must be a URL for PNG, JPG, GIF image.'
  }

  def self.latest
    Product.order(:updated_at).last
  end
end
