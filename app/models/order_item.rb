class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :set_unit_price

  def unit_price
    persisted? ? self[:unit_price] : product.price
  end

  def total
    unit_price.to_i * quantity.to_i
  end

  private

  def set_unit_price
    self[:unit_price] = unit_price
  end
end
