class UsersController < ApplicationController
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

	def admin? 
		if current_user.admin == true
			return true
		else
			return false
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
