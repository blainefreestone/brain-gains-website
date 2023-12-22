class TutoringSessionsController < ApplicationController
  def index
    @sessions = current_user.tutor_sessions
  end

  def create
  end

  def update
  end

  def destroy
    @session = TutoringSession.find(params[:id])
    @session.destroy

    redirect_to user_tutoring_sessions_path
  end
end
