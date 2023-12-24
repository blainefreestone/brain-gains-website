class TutorApplication < ApplicationRecord
  validates :educational_history, :tutoring_skills, presence: true
  
  belongs_to :tutor, class_name: "User"
end
