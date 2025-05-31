class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :staff, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true
      t.string :customer_name
      t.datetime :reservation_date
      t.references :status_master, null: false, foreign_key: true

      t.timestamps
    end
  end
end
