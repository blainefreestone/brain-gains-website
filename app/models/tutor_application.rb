class TutorApplication < ApplicationRecord
  belongs_to :tutor, class_name: "User"
end
