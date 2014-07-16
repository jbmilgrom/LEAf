class UsersController < ApplicationController

	def show

	end

	def new
  		@user = User.new
	end

	def create
		@user = User.new(user_attributes)
		if @user.save
			session[:user_id] = @user.id
  		redirect_to root_url, :notice => "Signed up!"
		else
  		render "new"
		end
	end

	def followers
		@user = User.find(params[:id])
	end

	def followees
	end

	private

	def user_attributes
  	params.require(:user).permit(:email, :password)
	end

end
