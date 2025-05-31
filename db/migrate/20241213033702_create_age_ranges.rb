class CreateAgeRanges < ActiveRecord::Migration[8.0]
  def change
    create_table :age_ranges do |t|
      t.string :age_range

      t.timestamps
    end
  end
end
