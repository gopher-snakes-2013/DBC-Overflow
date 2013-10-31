require 'spec_helper'

feature "View Comments" do
  context "on the homepage" do
    scenario "user can see created comments" do
      submission = Submission.create(url: "http://penguin.com", title: "A Resource")
      comment = submission.comments.create(content: "all about penguins")
      visit root_path
      expect(page).to have_content("all about penguins")
    end

    scenario "user can add a new comment" do
      submission = Submission.create(url: "http://penguin.com", title: "A Resource")
      visit root_path
      click_on "Add a Comment"
      expect(current_path).to eq(new_submission_comment_path(submission))
    end
  end
end

feature "New Comments" do
  before(:each) do
    @submission = Submission.create(url: "http://penguin.com", title: "A Resource")
    @comment = Comment.create(content: "all about penguins", submission_id: 1)
    visit root_path
    click_on "Add a Comment"
  end

  scenario "can be added, then user is redirected to home page" do
    fill_in "comment_content", with: "i like penguins a lot, thanks"
    click_button "Submit"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("i like penguins a lot, thanks")
  end
end
