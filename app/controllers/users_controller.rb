class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    tutor_show if current_user.tutor?
    student_show if current_user.student?
    admin_show if current_user.admin?
  end

  private

  def tutor_show
    if current_user.approved?
      @engagements = current_user.student_engagements
      render "tutor_show"
    else
      tutor_application
    end
  end

  def tutor_application
    redirect_to user_tutor_application_path
  end

  def student_show
    @tutor = current_user.engaged_tutor
    @engagement = current_user.tutor_engagement
    render "student_show"
  end

  def admin_show
    render "admin_show"
  end
end
