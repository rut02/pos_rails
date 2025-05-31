class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :product_category, null: false, foreign_key: true
      t.string :description
      t.float :unit_price

      t.timestamps
    end
  end
end
