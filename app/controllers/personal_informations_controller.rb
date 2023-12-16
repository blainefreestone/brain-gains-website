class PersonalInformationsController < ApplicationController
  def show
    if current_user.personal_information
      @personal_information = current_user.personal_information
    else
      @personal_information = current_user.build_personal_information
    end
  end

  def edit
    @grades = [ nil, "1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th", "9th", "10th", "11th", "12th"]
    if current_user.personal_information
      @personal_information = current_user.personal_information
    else
      @personal_information = current_user.build_personal_information
    end
  end

  def update

  end
end
