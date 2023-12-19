class Session < ApplicationRecord
  validate :engagement_must_have_tutor

  belongs_to :engagement

  has_one :student, through: :engagement
  has_one :tutor, through: :engagement

  def engagement_must_have_tutor
    unless engagement.tutor
      errors.add(:engagement, "must have a tutor")
    end
  end
end
