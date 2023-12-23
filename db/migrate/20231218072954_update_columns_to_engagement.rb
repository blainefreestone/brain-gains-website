class UpdateColumnsToEngagement < ActiveRecord::Migration[7.1]
  def change
    change_column_null :engagements, :tutor_id, true
  end
end
