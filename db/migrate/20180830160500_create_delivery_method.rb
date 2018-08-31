class CreateDeliveryMethod < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_methods do |t|
      t.string :name, null: false
      t.money :price, null: false
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
