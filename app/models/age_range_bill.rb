class AgeRangeBill < ApplicationRecord
  belongs_to :bill
  belongs_to :age_range

   def self.get_age_range_by_bill_id(bill_id)
    AgeRangeBill.includes(:age_range).where(bill_id: bill_id)
  end
end
