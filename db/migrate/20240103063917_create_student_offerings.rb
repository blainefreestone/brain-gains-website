class CreateStudentOfferings < ActiveRecord::Migration[7.1]
  def change
    create_table :student_offerings do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
