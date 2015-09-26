class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :user_id, null: false
      t.integer :cuser_id, null: false
      t.integer :amount, null: false
      t.float :latitude
      t.float :longitude
      t.integer :card_id, null: false

      t.timestamps null: false
    end
  end
end
