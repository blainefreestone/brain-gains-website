class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    if current_user.tutor?
      render "tutor_show"
    elsif current_user.student?
      render "student_show"
    elsif current_user.admin?
      render "admin_show"
    end
  end
end
