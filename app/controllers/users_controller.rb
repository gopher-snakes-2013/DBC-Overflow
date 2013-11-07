class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new
		# REVIEW: you need to encrypt the password.
		@user.username = params[:user][:username]
		@user.password = params[:user][:password]
		if @user.save
			redirect_to root_path
		else
			@errors= @user.errors.full_messages
			render new_user_path
		end
	end
end
