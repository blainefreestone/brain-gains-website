class AddTutorApplicationRefToSubject < ActiveRecord::Migration[7.1]
  def change
    add_reference :subjects, :tutor_application, null: false, foreign_key: true
  end
end
