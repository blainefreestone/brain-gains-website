class PersonalInformationsController < ApplicationController
  def edit
    @personal_information = current_user.personal_information || current_user.build_personal_information
  end

  def update
    if current_user.personal_information.update(personal_information_params)
      redirect_to root_path
    else
      flash[:error] = "Unable to update your personal information."
      redirect_to edit_user_personal_information_path
    end
  end

  protected

  def personal_information_params
    params.require(:personal_information).permit(:first_name, :last_name, :phone_number, :street_address, :city, :zipcode, :grade)
  end
end
