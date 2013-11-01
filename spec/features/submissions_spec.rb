require 'spec_helper'

feature "User browsing the website" do

  before(:each) do
    submission = Submission.new
    submission.title = "This is the Test Title"
    submission.url = "https://www.facebook.com/"
    submission.save
  end

  context "on homepage" do

    it "can click on the link" do
      visit ('/')
      click_on ('This is the Test Title')
      page.has_content?('Facebook')
    end

    it "there is a link to sign up" do
      visit root_path
      click_link('Sign Up!')
      expect(current_path).to eq('/users/new')
    end

  end

  context "on new user page" do

    it 'can create a new user' do
      visit new_user_path
      fill_in("user_username", :with => 'baby')
      fill_in("user_password", :with => 'babybaby')
      click_button("Register")
      expect(current_path).to eq(root_path)
    end

    it 'should stay on the sign up page when invalid pass is given' do
      visit new_user_path
      fill_in("user_username", :with => 'baby')
      fill_in("user_password", :with => 'ba')
      click_button("Register")
      expect(current_path).to eq('/users')
    end
  end


end