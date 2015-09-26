class CreateSoldProducts < ActiveRecord::Migration
  def change
    create_table :sold_products do |t|
      t.integer :record_id, null: false
      t.integer :product_id, null: false
      t.integer :amount, null: false

      t.timestamps null: false
    end
  end
end
