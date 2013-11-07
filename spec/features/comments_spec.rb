require 'spec_helper'

feature "View Comments" do
  let(:submission) { Submission.create(url: "http://penguin.com", title: "A Resource") }
  context "on the homepage" do
    scenario "user can see created comments" do
      comment = submission.comments.create(content: "all about penguins")
      visit root_path
      expect(page).to have_content("all about penguins")
    end

    scenario "user can add a new comment and should stay on home page" do
      visit root_path
      click_on "Add a Comment"
      expect(current_path).to eq(root_path)
    end
  end
end

feature "New Comments" do
  before(:each) do
    @comment = Comment.create(content: "all about penguins", submission_id: 1)
    visit root_path
    click_on "Add a Comment"
  end

  scenario "can be added to home page" do
    fill_in "comment_content", with: "i like penguins a lot, thanks"
    click_button "Submit"
    expect(page).to have_content("i like penguins a lot, thanks")
  end
end
