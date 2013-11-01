class VotesController < ApplicationController

  def create
    @vote = Vote.new
    @vote.direction = params[:direction]
    @vote.save
    redirect_to '/'
  end
end