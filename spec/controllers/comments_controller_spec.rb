require 'spec_helper'

describe CommentsController do
  let(:submission) { Submission.create(title: "i love you", url: "http://iloveu.xxx") }

  it "#new" do
    get :new, submission_id: submission.id
    expect(response.status.should eq 200)
  end

  it "create" do
    expect {
      post :create, submission_id: submission.id, comment: { content: "salarsucks" }
    }.to change { Comment.count }.by(1)
  end
end