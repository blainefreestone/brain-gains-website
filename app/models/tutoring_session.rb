class TutoringSession < ApplicationRecord
  validates :date, :engagement, presence: true
  validates :length_fifteen_minutes, presence: true, comparison: { greater_than: 3 }
  validate :engagement_must_have_tutor

  after_create do
    tutor.fifteen_minutes += length_fifteen_minutes
    tutor.save
    student.fifteen_minutes -= length_fifteen_minutes
    student.save
  end

  after_destroy do
    tutor.fifteen_minutes -= length_fifteen_minutes
    tutor.save
    student.fifteen_minutes += length_fifteen_minutes
    student.save
  end

  belongs_to :engagement

  has_one :student, through: :engagement
  has_one :tutor, through: :engagement

  def engagement_must_have_tutor
    errors.add(:engagement, "must have a tutor") unless engagement.tutor.present?
  end

  def length_hours
    length_fifteen_minutes.to_f / 4
  end

  def details_preview
    details.present? ? "#{details[0..20]}..." : "No details for this session"
  end
end
