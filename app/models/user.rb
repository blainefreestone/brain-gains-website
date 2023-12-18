class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable, :timeoutable

  before_create :set_role

  has_one :personal_information
  accepts_nested_attributes_for :personal_information

  # Student engagement associations for users that are tutors.
  has_many :student_engagements, foreign_key: "tutor_id", class_name: "Engagement"
  has_many :engaged_students, through: :student_engagements, source: :student

  # Tutor engagement association for users that are students.
  has_one :tutor_engagement, foreign_key: "student_id", class_name: "Engagement"
  has_one :engaged_tutor, through: :tutor_engagement, source: :tutor

  private

  def set_role
    if student == true
      self.tutor = false
    else
      self.tutor = true
    end
  end
end
