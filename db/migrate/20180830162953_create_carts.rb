class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :user_orders, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
    end
  end
end
