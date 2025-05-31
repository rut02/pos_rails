class GenderBill < ApplicationRecord
  belongs_to :bill
  belongs_to :gender

  def self.get_gender_by_bill_id(bill_id)
    GenderBill.includes(:gender).where(bill_id: bill_id)
  end
end
