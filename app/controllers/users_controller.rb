class UsersController < ApplicationController

	def show
		if current_user
			# @user = User.find(params[:id])
			@user = current_user
			@saved_articles = @user.articles
		else
			redirect_to sign_up_path		
		end
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
