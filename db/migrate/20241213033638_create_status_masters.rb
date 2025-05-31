class CreateStatusMasters < ActiveRecord::Migration[8.0]
  def change
    create_table :status_masters do |t|
      t.string :name

      t.timestamps
    end
  end
end
