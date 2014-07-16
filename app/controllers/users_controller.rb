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
	  user = User.find(params[:id])
    redirect_to sign_up_path and return unless current_user == user
    # followers = user.followers
    @followers_with_user = user.followers_with_user 
	end

	def followees
    user = User.find(params[:id])
    redirect_to sign_up_path and return unless current_user == user
    @followees_with_user = user.followees_with_user 
	end

	private

	def user_attributes
  	params.require(:user).permit(:email, :password, :first_name, :last_name)
	end

end
