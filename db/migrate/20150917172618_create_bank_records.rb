class CreateBankRecords < ActiveRecord::Migration
  def change
    create_table :bank_records do |t|
      t.integer :bank_account_id, null: false
      t.float :amount, null: false

      t.timestamps null: false
    end
  end
end
