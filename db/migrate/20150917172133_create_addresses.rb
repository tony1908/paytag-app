class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :ext, null: false
      t.string :int
      t.string :state, null: false
      t.string :city, null: false
      t.integer :cp, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
