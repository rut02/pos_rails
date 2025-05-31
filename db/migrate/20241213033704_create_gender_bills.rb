class CreateGenderBills < ActiveRecord::Migration[8.0]
  def change
    create_table :gender_bills do |t|
      t.references :bill, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
