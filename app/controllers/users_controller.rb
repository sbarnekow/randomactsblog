class UsersController < ApplicationController


	def index
		@user = User.all 
	end

	def new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "you've registered!"
			redirect_to '/'
		else flash[:alert] = "please try again"
			redirect_to :back
		end
	end

	def edit 
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to users
		else 
			render 'edit'
			flash[:notice] = "Something went wrong."
		end
	end

	def show 
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :admin)
	end
end
