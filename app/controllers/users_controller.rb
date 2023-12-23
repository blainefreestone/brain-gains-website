class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    if current_user.tutor? && current_user.approved?
      @engagements = current_user.student_engagements
      render "tutor_show"
    elsif current_user.tutor? && !current_user.approved?
      @engagements = current_user.student_engagements
      render "tutor_show"
    elsif current_user.student?
      @tutor = current_user.engaged_tutor
      @engagement = current_user.tutor_engagement
      render "student_show"
    elsif current_user.admin?
      render "admin_show"
    end
  end
end
