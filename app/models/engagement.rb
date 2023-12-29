class Engagement < ApplicationRecord
  validates :student, :details, :subject, :availability, :fifteen_minutes_per_week, presence: true
  validate :student_must_be_student,
           :tutor_must_be_tutor

  belongs_to :tutor, class_name: "User", optional: true
  belongs_to :student, class_name: "User"

  has_many :tutoring_sessions, dependent: :destroy

  def student_must_be_student
    errors.add(:student, "must be a student") unless student.student?
  end

  def tutor_must_be_tutor
    return unless tutor # If there is no tutor, do not check if tutor is a tutor.

    errors.add(:tutor, "must be a tutor") unless tutor.tutor?
  end

  def hours_per_week
    fifteen_minutes_per_week.to_f / 4
  end
end
