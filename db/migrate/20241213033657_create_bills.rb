class CreateBills < ActiveRecord::Migration[8.0]
  def change
    create_table :bills do |t|
      t.string :doc_no
      t.datetime :doc_date
      t.float :total_price, default: 0
      t.integer :total_amount, default: 0
      t.float :discount ,default: 0
      t.float :get_paid ,default: 0
      t.float :change ,default: 0
      t.references :member, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true
      t.references :status_master, null: false, foreign_key: true
      t.string :customer_name
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
