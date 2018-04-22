class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :first_name,  null: false
      t.string :last_name,   null: false
      t.string :email,       null: false
      t.string :address,     null: false
      t.decimal :total, scale: 2, precision: 5, null: false, default: 0
      t.decimal :discount, scale: 2, precision: 5, null: false, default: 0

      t.timestamps
    end
  end
end
