class TutorApplication < ApplicationRecord
  has_many :application_questions

  belongs_to :tutor, class_name: "User"
end
