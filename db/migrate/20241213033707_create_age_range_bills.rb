class CreateAgeRangeBills < ActiveRecord::Migration[8.0]
  def change
    create_table :age_range_bills do |t|
      t.references :bill, null: false, foreign_key: true
      t.references :age_range, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
