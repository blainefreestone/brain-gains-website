class PagesController < ApplicationController
  def home
    @lead = Lead.new
  end

  def about
    @lead = Lead.new
  end

  def how_it_works
    @lead = Lead.new
  end
end
