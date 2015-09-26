class CreateCardTransactions < ActiveRecord::Migration
  def change
    create_table :card_transactions do |t|
      t.string :status, null: false
      t.integer :card_id, null: false
      t.integer :record_id

      t.timestamps null: false
    end
  end
end
