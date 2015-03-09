class SummariesController < ApplicationController
  def new
    @summary = Summary.new
  end
  
  def create
    #@summary = current_user.summary
  end

  def show
  end
end
