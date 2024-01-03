class StudentOffering < ApplicationRecord
  belongs_to :offer
  belongs_to :student, class_name: "User"
end
