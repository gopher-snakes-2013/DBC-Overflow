require 'spec_helper'

describe UsersController do
	it "should have a #new action" do
		get :new
		response.status.should eq(200)
	end
	context "#create" do
		it 'creates a new user given proper params' do
			expect {
				post :create, user: { username: 'buffy', password: 'crazytime' }
			}.to change { User.count }.by(1)
		end
		it 'doesnt create a new user if its given invalid params' do
			expect{
				post :create, user: {username: 'new guy'}
			}.to_not change { User.count }
		end
	end
end