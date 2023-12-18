class AddColumnsToEngagement < ActiveRecord::Migration[7.1]
  def change
    add_column :engagements, :details, :text
    add_column :engagements, :subject, :string
    add_column :engagements, :availability, :text
    add_column :engagements, :fifteen_minutes_per_week, :integer
  end
end
