class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update, :destroy]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path, notice: "Thank You for Joining Us!"
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		@user.update(user_params)
    redirect_to user_path
	end

	private
	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
