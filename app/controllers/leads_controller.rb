class LeadsController < ApplicationController
  def create
    @lead = Lead.new(lead_params)

    if @lead.save
      flash[:success] = "Information submitted successfully! We will contact you shortly :)"
      redirect_to home_path
    else
      flash.now[:error] = "Unable to submit your information."
      render 'pages/home', status: :unprocessable_entity
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:name, :email, :phone_number)
  end
end
