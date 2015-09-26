class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.string :photo
      t.text :description
      t.integer :cuser_id
      t.integer :stock, default: 0
      t.string :brand
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
