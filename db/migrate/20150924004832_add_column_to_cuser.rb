class AddColumnToCuser < ActiveRecord::Migration
  def change
    add_column :cusers, :user_id, :integer, null: false
  end
end
