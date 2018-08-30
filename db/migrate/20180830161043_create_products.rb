class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :details
      t.string :size
      t.money :price, null: false
    end
  end
end
