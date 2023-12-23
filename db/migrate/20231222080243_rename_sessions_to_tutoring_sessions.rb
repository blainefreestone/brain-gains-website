class RenameSessionsToTutoringSessions < ActiveRecord::Migration[7.1]
  def change
    rename_table :sessions, :tutoring_sessions
  end
end
