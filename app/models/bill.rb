class Bill < ApplicationRecord
  belongs_to :member ,optional: true
  belongs_to :reservation ,optional: true
  belongs_to :status_master,optional: true
  belongs_to :table,optional: true
  
  attr_accessor :cid 
  has_many :gender_bills, inverse_of: :bill
  has_many :age_range_bills, inverse_of: :bill
  
  accepts_nested_attributes_for :gender_bills
  accepts_nested_attributes_for :age_range_bills

  before_create :set_doc_no_doc_date
  after_create :open_table 
  before_update :Paid 
 def as_json(options = {})
    super(options.merge(
      include: {
        age_range_bills: {
          include: {
            age_range: { only: [:id, :age_range] }
          },
          only: [:amount]
        },
        gender_bills: {
          include: {
            gender: { only: [:id, :gender] }
          },
          only: [:amount]
        },
        status_master: { only: [:id, :name] },
      },
       methods: [:table_name]
    ))
  end
  def set_doc_no_doc_date
    if self.reservation_id != nil 
      if Reservation.find_by(id: self.reservation_id).status_master_id != StatusMaster::RESERVED
        errors.add(:reservation_id, "reservation is not reserved")
        throw(:abort)
      end
      self.customer_name = reservation.customer_name
      self.table_id = reservation.table_id
      reservation.update(status_master_id: StatusMaster::COMPLETED)
      datepart = Date.today.strftime("%Y%m%d")
      number = Bill.count + 1
      self.doc_no = "Bill-#{datepart}-#{number}"  
      self.doc_date = Time.now
      self.status_master_id = StatusMaster.find_by(name: "Opened").id
    else
      if table.status_master_id != StatusMaster::AVAILABLE
        errors.add(:table_id, "table is not available")
        throw(:abort)
      else
    datepart = Date.today.strftime("%Y%m%d")
    number = Bill.count + 1
    self.doc_no = "Bill-#{datepart}-#{number}"  
    self.doc_date = Time.now
    self.status_master_id = StatusMaster.find_by(name: "Opened").id
      end
    end
  end

  def open_table
    Table.find_by(id: table_id).update(status_master_id: StatusMaster::OPENED)
    # reservation.table.update(status_master_id: StatusMaster::OPENED)
    # reservation.table.status_master_id = StatusMaster::OPENED
    # reservation.table.save
  end
  def close_table
    Table.find_by(id: table_id).update(status_master_id: StatusMaster::AVAILABLE)
    # reservation.table.update(status_master_id: StatusMaster::AVAILABLE)
  end
  def Paid
    if status_master_id == StatusMaster::PAID
      print"total price"
      p total_price
      print"get paid"
      p get_paid

        if cid != nil
          c_card=cid
          is_member=Member.find_by(cid: c_card)
            if is_member != nil
              self.member_id = is_member.id
                if is_member.expired < Time.now
                  errors.add(:cid, "expired")
                  throw(:abort)
                else
                  discount = total_price * 0.1

                  v_total_price = total_price - discount
                  p v_total_price
                  change = get_paid - v_total_price
                end
            else
              errors.add(:cid, "not found")
              throw(:abort)
            end
        else
          discount = 0
          v_total_price = total_price - discount
          change = get_paid - v_total_price
        end
        if change < 0
          errors.add(:get_paid, "not enough")
          throw(:abort)        
        else
          self.discount = discount
          self.change = change
          self.total_price = v_total_price
          close_table
          p "close table"
          # self.save
         
        end
    end
        
  end
  def count_amount
    total_amount = gender_bills.sum(:amount)
    return total_amount
  end
def table_name
  Table.get_table_name(table_id)
end
end
