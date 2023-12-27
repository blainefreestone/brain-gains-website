class TutorApplication < ApplicationRecord
  validates :educational_history, :tutoring_skills, presence: true
  has_many :subjects

  belongs_to :tutor, class_name: "User"

  def add_subjects(subject_params)
    subject_params.each { |key, _| subjects.create(name: key) }
  end
end
