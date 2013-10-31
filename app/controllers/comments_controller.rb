class CommentsController < ApplicationController
  def new
    render :new
  end
  def create
    @comment = Comment.create(params[:comment])
    redirect_to root_path
  end
end