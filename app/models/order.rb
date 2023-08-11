class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  before_save :set_subtotal

  def subtotal
    order_items.collect do |order_item|
      if order_item.valid? && order_item.unit_price.present? && order_item.quantity.present?
        order_item.unit_price * order_item.quantity.to_i
      else
        0
      end
    end.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
