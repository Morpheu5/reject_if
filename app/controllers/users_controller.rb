class UsersController < ApplicationController
	
	## REST stuff
	
	def index
		@users = User.all
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "User created"
			redirect_to @user
		else
			render :new
		end
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "User updated"
			redirect_to @user
		else
			render :edit
		end
	end
	
	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed"
	end
	
	## forms
	
	def new
		@user = User.new
		@user.contacts.build
	end
	
	def edit
		@user = User.find(params[:id])
	end
end
