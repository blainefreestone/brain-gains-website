class AddColumnsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :fifteen_minutes, :integer, default: 0
  end
end
