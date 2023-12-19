class Session < ApplicationRecord
  validates :date, :details, :engagement, presence: true
  validates :length_fifteen_minutes, presence: true, comparison: { greater_than: 3 }
  validate :engagement_must_have_tutor

  belongs_to :engagement

  has_one :student, through: :engagement
  has_one :tutor, through: :engagement

  def engagement_must_have_tutor
    unless engagement.tutor.present?
      errors.add(:engagement, "must have a tutor")
    end
  end
end
