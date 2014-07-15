class SavedArticlesController < ApplicationController
	
	def index
		if current_user
			# @user = User.find(params[:id])
			@user = current_user
			@saved_articles = @user.articles
		else
			redirect_to sign_up_path		
		end
	end

end
