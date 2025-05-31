class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :bill, null: false, foreign_key: true
      t.string :doc_no
      t.datetime :doc_date
      t.float :total_price ,default: 0
      t.integer :total_amount, default: 0
      t.references :staff, null: false, foreign_key: true
      t.references :status_master, null: false, foreign_key: true

      t.timestamps
    end
  end
end
