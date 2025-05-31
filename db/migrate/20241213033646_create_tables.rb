class CreateTables < ActiveRecord::Migration[8.0]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :capacity
      t.references :status_master, null: false, foreign_key: true

      t.timestamps
    end
  end
end
