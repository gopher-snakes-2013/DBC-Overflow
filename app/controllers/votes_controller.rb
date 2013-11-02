class VotesController < ApplicationController

  def create
    @submission = Submission.find(params[:submission_id])
    @vote = @submission.votes.new
    p params
    @vote.direction = params[:vote][:direction]
    @vote.save

    tally = @submission.votes.sum(:direction)

    if tally
      render json: {tally: tally}
    else
      redirect_to '/'
    end
  end
end