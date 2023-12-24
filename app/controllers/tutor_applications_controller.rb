class TutorApplicationsController < ApplicationController
  def show
    @application_present = current_user.tutor_application.present?
  end
  
  def new
    @application = current_user.build_tutor_application
  end

  def create
    @application = current_user.build_tutor_application(tutor_application_params)

    if @application.save
      redirect_to user_tutor_application_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @application = current_user.tutor_application
  end

  def update
    @application = current_user.tutor_application

    if @application.update(tutor_application_params)
      redirect_to user_tutor_application_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def tutor_application_params
    params.require(:tutor_application).permit(:educational_history, :tutoring_skills, :resume)
  end
end