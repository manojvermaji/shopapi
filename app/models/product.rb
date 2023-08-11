class Product < ApplicationRecord
  has_many :order_items
  validates :title, :price, presence: true

end
