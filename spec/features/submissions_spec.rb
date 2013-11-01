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

    before(:each) do
      visit new_user_path
    end

    it 'can create a new user' do
      fill_in("user_username", :with => 'baby')
      fill_in("user_password", :with => 'babybaby')
      click_button("Register")
      expect(current_path).to eq(root_path)
    end

    it 'should stay on the sign up page when invalid pass is given' do
      fill_in("user_username", :with => 'baby')
      fill_in("user_password", :with => 'ba')
      click_button("Register")
      expect(current_path).to eq('/users')
    end

    describe 'should show some errors on the page when invalid params are given' do
      it "should say password can't be blank when no password is given" do
        fill_in("user_username", :with => 'baby')
        click_button("Register")
        expect(page).to have_content("Password can't be blank")
      end

      it "should say password is too short when it isn't at least 6 characters" do
        fill_in("user_username", :with => 'baby')
        fill_in("user_password", :with => 'poo')
        click_button("Register")
        expect(page).to have_content("Password is too short (minimum is 6 characters)")
      end

      it "should say username can't be blank when no username is given" do
        fill_in("user_password", :with => 'password')
        click_button("Register")
        expect(page).to have_content("Username can't be blank")
      end

      it "should throw both errors when nothing is given" do
        click_button("Register")
        expect(page).to have_content("Username can't be blank Password can't be blank")
      end
    end
  end
end