class Order < ApplicationRecord
  belongs_to :bill 
  belongs_to :staff
  belongs_to :status_master ,optional: true
  has_many :order_items
  accepts_nested_attributes_for :order_items
  

  before_create :set_defaults
  validate :check_cancel , on: :update
  after_update :set_total_to_bill


    def as_json(options = {})
    super(options.merge(
      include: {
        order_items: {
          include: {
            product: { only: [:id, :name, :price] } 
          },
          only: [:id, :amount, :created_at] 
        },
        bill: { 
          include: {
            table: { only: [:id, :name] },
      },
          
        only: [:id, :table_id, :total_amount] },
        staff: { only: [:id, :name] },
        status_master: { only: [:id, :name] }
      }
    ))
  end
  def set_defaults
    if bill.status_master_id != StatusMaster::OPENED
      errors.add(:bill_id, "bill is not opened")
      throw(:abort)
    else
    datepart = Date.today.strftime("%Y%m%d")
    number = Order.count + 1
    self.doc_no = "Order-#{datepart}-#{number}"  
    self.doc_date = Time.now
    self.status_master_id =  StatusMaster.find_by(name: "Pending").id
    end
  end
  def check_cancel
    # debugger
    db_s = Order.find_by(id: self.id)
    # p db_s
    if db_s.status_master_id == StatusMaster::SERVED && self.status_master_id == StatusMaster::CANCELLED
        errors.add(:status_master_id, "can't be cancelled order is served")
        throw(:abort)
    end
  end
  def set_total_to_bill
    if self.status_master_id == StatusMaster::SERVED
    Bill.find_by(id: self.bill_id).update(total_price: self.total_price ,total_amount: self.total_amount)
   
    end
    
  end
    def recalculate_totals!
    update_columns(
      total_price: order_items.sum(:price),
      total_amount: order_items.sum(:amount)
    )
  end
end
