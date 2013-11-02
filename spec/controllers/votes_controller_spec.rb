require 'spec_helper'

describe VotesController do

  context "#create" do

    let(:params){
      {votes: { direction: 1}}
    }

    it "should result in a create action that initializes object in table" do
      submission = Submission.new(title: 'this is a title', url: 'http://google.com')
      submission.save
      params[:votes][:submission_id] = submission.id
      expect {
        post :create, params[:votes]
      }.to change(Vote, :count).by(1)
      end
  end
end