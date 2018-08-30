class CreateUserOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :user_orders do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.references :delivery_method, foreign_key: true
      t.datetime :date_order_placed, null: false
      t.datetime :date_order_paid

      t.timestamps
    end
  end
end
