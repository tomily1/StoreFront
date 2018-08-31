class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :user_order, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :quantity, default: 0
    end
  end
end
