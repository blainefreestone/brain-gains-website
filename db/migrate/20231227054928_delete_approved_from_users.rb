class DeleteApprovedFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :approved
  end
end
