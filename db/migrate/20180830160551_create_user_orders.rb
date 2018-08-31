class CreateUserOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :user_orders do |t|
      t.string :session_id
      t.references :delivery_method, foreign_key: true
      t.datetime :date_order_paid

      t.timestamps
    end
  end
end
