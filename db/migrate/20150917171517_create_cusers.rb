class CreateCusers < ActiveRecord::Migration
  def change
    create_table :cusers do |t|
      t.string :defaultAccount

      t.timestamps null: false
    end
  end
end
