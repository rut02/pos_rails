class Table < ApplicationRecord
  belongs_to :status_master,optional: true
  has_many :reservations
  before_create :set_defaults

  def set_defaults
    self.status_master_id = StatusMaster.find_by(name: "Available").id
  end
  def self.getStatusMaster(id)
    # id=id.
    status = StatusMaster.find_by(id:id)
    p "ID: #{id}"
    p "Status: #{status}"
  
    if status
      return status.name
    else
      return "Status not found"
    end
  end
  def self.get_table_name(id)
    table = Table.find_by(id: id)
    if table
      return table.name
    else
      return "Table not found"
    end
  end
  def self.check_reservation
    # debugger   
    p "check_reservation"
    Reservation.where(status_master:StatusMaster::RESERVED).each do|reservation|
      if reservation.reservation_date < Time.now &&  reservation.status_master_id == StatusMaster::RESERVED && Bill.find_by(reservation_id: reservation.id) == nil
        p "check_reservationcdddddd"
        Table.find_by(id: reservation.table_id)&.update(status_master_id: StatusMaster::AVAILABLE)

        reservation.update(status_master_id: StatusMaster::CANCELLED)
      end

    end
  end
end
