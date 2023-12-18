class Engagement < ApplicationRecord
  validates :student, :details, :subject, :availability, :fifteen_minutes_per_week, presence: true
  validate :student_must_be_student,
           :tutor_must_be_tutor

  belongs_to :tutor, class_name: "User", optional: true
  belongs_to :student, class_name: "User"

  def student_must_be_student
    unless student.student?
      errors.add(:student, "must be a student")
    end
  end

  def tutor_must_be_tutor
    unless tutor.tutor?
      errors.add(:tutor, "must be a tutor")
    end
  end
end