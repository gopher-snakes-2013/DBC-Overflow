class CommentsController < ApplicationController
  def create
    @submission = Submission.find(params[:submission_id])
    @comment = @submission.comments.build(params[:comment])
    if @comment.save
      render json: {submission_id: @submission.id, comment_content: @comment.content}
    else
      # unhappy path is not handled correctly, it needs to respond with json
      render :json => @submission.errors.full_messages.join(', '), :status => :unprocessable_entity
      render :json => {:errors => @submission.errors.full_messages}, :status => :unprocessable_entity
      redirect_to root_path
    end
  end
end
