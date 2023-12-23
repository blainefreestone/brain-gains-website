class CreateTutorApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :tutor_applications do |t|

      t.timestamps
    end
  end
end
