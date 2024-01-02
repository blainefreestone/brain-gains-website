class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable, :timeoutable

  after_create :create_stripe_customer

  # Personal Information associations.
  has_one :personal_information, dependent: :destroy
  delegate :first_name, :last_name, :phone_number, :street_address, :city, :zipcode, to: :personal_information
  accepts_nested_attributes_for :personal_information

  # Student engagement associations for users that are tutors.
  has_many :student_engagements, foreign_key: "tutor_id", class_name: "Engagement", dependent: :destroy
  has_many :engaged_students, through: :student_engagements, source: :student
  has_many :tutor_sessions, through: :student_engagements, source: :tutoring_sessions

  # Tutor engagement association for users that are students.
  has_one :tutor_engagement, foreign_key: "student_id", class_name: "Engagement", dependent: :destroy
  has_one :engaged_tutor, through: :tutor_engagement, source: :tutor
  has_many :student_sessions, through: :tutor_engagement, source: :tutoring_sessions

  # Application associatons.
  has_one :tutor_application, foreign_key: "tutor_id", dependent: :destroy
  has_many :subjects, through: :tutor_application

  def set_default_roles
    self.tutor = if student
                   false
                 else
                   true
                 end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_address
    return nil unless street_address.present?

    "#{street_address}, #{city} #{zipcode}"
  end

  def create_stripe_customer
    Stripe::Customer.create(email: email)
  end
end
