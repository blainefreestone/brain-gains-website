class AddColumnsToTutorApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :tutor_applications, :educational_history, :text
    add_column :tutor_applications, :tutoring_skills, :text
    add_column :tutor_applications, :resume, :text
  end
end
