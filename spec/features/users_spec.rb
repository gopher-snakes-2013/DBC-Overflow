require 'spec_helper'

feature "User browsing the website" do

  submission = FactoryGirl.build(:submission)
  # before(:each) do

  #   submission = Submission.new
  #   submission.title = "This is the Test Title"
  #   submission.url = "https://www.facebook.com/"
  #   submission.save
  # end

  context "on homepage" do

    it "can click on the link" do
      visit ('/')
      click_on ('This is the Test Title')
      page.has_content?('Facebook')
    end
  end
end