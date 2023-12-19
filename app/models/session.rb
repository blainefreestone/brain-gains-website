class Session < ApplicationRecord
  belongs_to :engagement

  has_one :student, through: :engagement
  has_one :tutor, through: :engagement
end
