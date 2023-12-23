class TutorApplicationsController < ApplicationController
  def show
    @application_present = current_user.tutor_application.present?
  end
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
