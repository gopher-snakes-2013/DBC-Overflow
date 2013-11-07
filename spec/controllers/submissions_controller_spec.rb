require 'spec_helper'


describe SubmissionsController do
  describe "#index" do
    it "should have an index action" do
      get :index
      expect(response.status).to eq 200
      response.status.should eq 200
      expect(response.status.should eq 200)
    end
  end

  describe "#new" do
    it "should have a new action" do
      get :new
      expect(response.status.should eq 200) # either use expect or should
    end
  end

  describe "#create" do

    let(:params){
      {submissions: { title: "This is our title", url: "https://www.google.com" }}
    }

    it "should have a create action so peeps can post stuff" do
      expect {
        post :create, params
      }.to change(Submission, :count).by(1)

      end
  end

end
