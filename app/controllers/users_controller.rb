class UsersController < ApplicationController

	def show
		user = User.find(params[:id])
		@saved_articles = user.articles
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

	private

	def user_attributes
  	params.require(:user).permit(:email, :password)
	end

end
