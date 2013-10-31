require 'spec_helper'

feature "Homepage" do
  before(:each) do
    @submission = Submission.create(url: "http://poop.com", title: "A Resource")
    @comment = Comment.create(content: "all about poop", submission_id: 1)
    visit root_path
  end

  context "user can add a comment" do
    it "that shows under its submission" do
      expect(page).to have_content("all about poop")
    end

    it "by clicking on a button" do
      click_on "Add a Comment"
      expect(current_path).to eq(new_comment_path)
    end
  end

end
