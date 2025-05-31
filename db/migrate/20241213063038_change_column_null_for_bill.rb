class ChangeColumnNullForBill < ActiveRecord::Migration[8.0]
  def change
    change_column_null :bills, :member_id, true
    change_column_null :bills, :reservation_id, true
  end
end
