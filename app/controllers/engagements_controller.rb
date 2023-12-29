class EngagementsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @engagement = Engagement.find(params[:id])
  end
end
