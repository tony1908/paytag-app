class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.integer :cuser_id, null: false
      t.string :AccountNumber, null: false
      t.string :name, default: "Account"
      t.string :clabe, null: false
      t.string :bank, null: false

      t.timestamps null: false
    end
  end
end
