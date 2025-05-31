class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members do |t|
      t.integer :cid
      t.string :name
      t.datetime :expired
      t.references :status_master, null: false, foreign_key: true

      t.timestamps
    end
  end
end
