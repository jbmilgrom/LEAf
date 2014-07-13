class UsersController < ApplicationController

	def show
		user = User.find(params[:id])
		@saved_articles = user.articles
	end
end
