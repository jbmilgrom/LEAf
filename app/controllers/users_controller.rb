class UsersController < ApplicationController

	def show
		user = User.find(params[:id])
		@saved_articles = user.articles
	end

	def new
  		@user = User.new
	end

	def create
		binding.pry
		@user = User.new(user_attributes)
    #@user.save will return certain message/objects/notsure such that it responds to .errors es explicated in new.html.erb in Users views
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
