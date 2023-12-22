class SessionsController < ApplicationController
  def index
    @sessions = current_user.tutor_sessions
  end

  def create
  end

  def update
  end

  def destroy
  end
end
