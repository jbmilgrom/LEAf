class UsersController < ApplicationController

	def show
		user = User.find(params[:id])
		@saved_articles = user.saved_articles
	end
end
