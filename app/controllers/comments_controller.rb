class CommentsController < ApplicationController
  def new
    @submission = Submission.find(params[:submission_id])
    @comment = @submission.comments.new
    render :new
  end

  def create
    @submission = Submission.find(params[:submission_id])
    @comment = @submission.comments.new(params[:comment])
    if @comment.save
      redirect_to root_path
    else
      render :new
    end
  end
end