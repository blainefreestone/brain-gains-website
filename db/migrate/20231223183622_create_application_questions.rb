class CreateApplicationQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :application_questions do |t|
      t.text :question_text
      t.text :answer_text

      t.timestamps
    end
  end
end
