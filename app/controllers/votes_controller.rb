class VotesController < ApplicationController

  def create
    @submission = Submission.find(params[:submission_id])
    @vote = @submission.votes.new
    @vote.direction = params[:vote][:direction]

    if @vote.save
      render json: {tally: @sumbission.tally}
    else
      # bad response, needs json
      redirect_to root_path
    end
  end
end
