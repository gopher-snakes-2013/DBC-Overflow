class SubmissionsController < ApplicationController
  def index
    @submission = Submission.all
  end

  def new
  end

  def create
    @new_submission = Submission.new
    @new_submission.title = params[:submissions][:title]
    @new_submission.url = params[:submissions][:url]
    @new_submission.save
    redirect_to new_submission_path unless @new_submission.save
    redirect_to root_path
  end
end
