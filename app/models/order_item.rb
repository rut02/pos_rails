class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_create :set_defaults
  after_create :trigger_order_recalculation

  def set_defaults
    if order.status_master_id == StatusMaster::SERVED || order.status_master_id == StatusMaster::CANCELLED
      errors.add(:order_id, "this order is not pending")
      throw(:abort)
    else
    self.unit_price = self.product.unit_price
    self.price = self.amount * self.unit_price
    end
  end
  def set_total
    order.total_price = order.total_price + self.price
    order.total_amount = order.total_amount + self.amount
    order.save
    p "triggered after create"
  end
    def trigger_order_recalculation
    order.recalculate_totals!
  end
end
