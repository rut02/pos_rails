class Reservation < ApplicationRecord
  belongs_to :staff
  belongs_to :table
  belongs_to :status_master , optional: true

  before_create:check_status_table
  before_create :set_date
  after_create :reserve_table

  def set_date
    # config.time_zone = ‘UTC’
    # self.reservation_date = Time.now
    self.status_master_id = StatusMaster.find_by(name: "Reserved").id
  end
  def reserve_table
    Table.find_by(id: self.table_id).update(status_master_id: StatusMaster::RESERVED)
  end
  def self.get_table_name(id)
    table = Table.find_by(id: id)
    if table
      return table.name
    else
      return "Table not found"
    end
  end

  def self.get_status_name(id)
    status = StatusMaster.find_by(id: id)
    if status
      return status.name
    else
      return "Status not found"
    end
  end
  def self.get_reserved_reservations
    Reservation.where(status_master_id: StatusMaster::RESERVED)
  end

  def self.get_cancelled_reservations
    Reservation.where(status_master_id: StatusMaster::CANCELLED)
  end

  def self.get_completed_reservations
    Reservation.where(status_master_id: StatusMaster::COMPLETED)
  end

  private
  def check_status_table
    db_s = Table.find_by(id: self.table_id)
    p "check_status_table"
    if db_s.status_master_id != StatusMaster::AVAILABLE
      errors.add(:table_id, "table is not available")
      throw(:abort)
    end
  end
end
