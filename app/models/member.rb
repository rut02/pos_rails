class Member < ApplicationRecord
  belongs_to :status_master
  before_create :set_expiration_date
  def set_expiration_date
    self.expired = Time.now + 1.year
    
  end
end
