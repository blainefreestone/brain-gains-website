class Engagement < ApplicationRecord
  validates :student, :details, :subject, :availability, :fifteen_minutes_per_week, presence: true
  validate :student_must_be_student,
           :tutor_must_be_tutor

  belongs_to :tutor, class_name: "User", optional: true
  belongs_to :student, class_name: "User"

  has_many :sessions

  def student_must_be_student
    if student && !student.student?
      errors.add(:student, "must be a student")
    end
  end

  def tutor_must_be_tutor
    if tutor && !tutor.tutor?
      errors.add(:tutor, "must be a tutor")
    end
  end

  def hours_per_week
    fifteen_minutes_per_week.to_f / 4
  end
end