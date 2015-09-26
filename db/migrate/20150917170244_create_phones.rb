class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number, null: false 
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
