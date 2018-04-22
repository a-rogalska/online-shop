class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_code, null: false
      t.string :name, null: false
      t.decimal :price, scale: 2, precision: 5, null: false, default: 0

      t.timestamps
    end
  end
end
