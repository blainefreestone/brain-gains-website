class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable

  before_create :set_role

  has_one :personal_information
  accepts_nested_attributes_for :personal_information

  private

  def set_role
    if student == true
      self.tutor = false
    else
      self.tutor = true
    end
  end
end
