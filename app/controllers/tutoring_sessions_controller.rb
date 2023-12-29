class TutoringSessionsController < ApplicationController
  before_action :authenticate_user!

  def index
    tutor_index if current_user.tutor?
    student_index if current_user.student?
    admin_index if current_user.admin?
  end

  def create
    engagement = current_user.student_engagements.where(student_id: params[:student_id]).first
    @session = engagement.tutoring_sessions.new(tutoring_session_params)

    if @session.save
      redirect_to user_tutoring_sessions_path
    else
      redirect_to user_tutoring_sessions_path, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
    @session = TutoringSession.find(params[:id])
    @session.destroy

    redirect_to user_tutoring_sessions_path
  end

  private

  def tutor_index
    @sessions = current_user.tutor_sessions

    @new_session = TutoringSession.new(date: Date.today)
    @students = current_user.engaged_students.to_a
  end

  def student_index
  end

  def admin_index
  end

  def tutoring_session_params
    params[:tutoring_session][:length_fifteen_minutes] = (params[:num_hours].to_i * 4) + params[:num_fifteen_minutes].to_i
    params.require(:tutoring_session).permit(:date, :length_fifteen_minutes, :details)
  end
end
