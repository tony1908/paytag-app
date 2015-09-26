class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, default: "Card"
      t.string :last4, null: false
      t.string :openPay, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
