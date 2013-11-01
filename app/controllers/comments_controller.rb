class CommentsController < ApplicationController
  def create
    @submission = Submission.find(params[:submission_id])
    @comment = @submission.comments.new(params[:comment])
    if @comment.save
      render json: {submission_id: @submission.id, comment_content: @comment.content}
    else
      redirect_to root_path
    end
  end
end