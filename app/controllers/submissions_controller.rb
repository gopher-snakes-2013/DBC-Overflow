# index, show, new, create, edit, update, destroy
class SubmissionsController < ApplicationController
  def index
    @submission = Submission.all
  end

  # REVIEW: empty methods and files are evil
  def show

  end

  def new
    @submission = Submission.new
  end

  # def edit
  #   @submission = Submission.find params[:id]
  # end

  def create
    @new_submission = Submission.new
    @new_submission.title = params[:submissions][:title]
    @new_submission.url = params[:submissions][:url]
    if @new_submission.save
      redirect_to root_path
    else
      redirect_to new_submission_path
    end
  end

end
