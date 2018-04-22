class CreateProductOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :product_orders do |t|
      t.integer :order_id,   index: true
      t.integer :product_id, index: true
      t.integer :count, null: false, default: 0
    end
  end
end
