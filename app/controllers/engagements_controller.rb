class EngagementsController < ApplicationController
  def show
    @engagement = Engagement.find(params[:id])
  end
end
