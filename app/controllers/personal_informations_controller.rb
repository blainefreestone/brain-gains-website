class PersonalInformationsController < ApplicationController
  def show
    if current_user.personal_information
      @personal_information = current_user.personal_information
    else
      @personal_information = current_user.build_personal_information
    end
  end

  def edit
    # @grades = [["1st", 1], ["2nd", 2], ["3rd"], 3, ["4th", 4], ["5th", 5], ["6th", 6], ["7th", 7], ["8th", 8], ["9th", 9], ["10th", 10], ["11th", 11], ["12th", 12]]
    if current_user.personal_information
      @personal_information = current_user.personal_information
    else
      @personal_information = current_user.build_personal_information
    end
  end

  def update
    if current_user.personal_information.update(personal_information_params)
      redirect_to root_path
    else
      flash.now[:error] = "Unable to update your personal information."
      render 'edit', status: :unprocessable_entity
    end
  end

  protected

  def personal_information_params
    params.require(:personal_information).permit(:first_name, :last_name, :phone_number, :street_address, :city, :zipcode, :grade)
  end
end
