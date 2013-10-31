require 'spec_helper'

describe CommentsController do
  it "#new" do
    get :new
    expect(response.status.should eq 200)
  end

  it "create" do
    expect {
      post :create, comment: { content: "salarsucks", submission_id: 1 }
    }.to change { Comment.count }.by(1)
  end
end