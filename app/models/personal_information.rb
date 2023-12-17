class PersonalInformation < ApplicationRecord
  validates :first_name, :last_name, :phone_number, presence: true

  belongs_to :user
end
