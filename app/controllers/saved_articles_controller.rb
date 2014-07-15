class SavedArticlesController < ApplicationController
	
	# respond_to :json
	def index
		if current_user
			# binding.pry
			# @user = User.find(params[:id])
			# @user = current_user
			saved_articles = current_user.articles
			
			respond_to do |format|
		  	format.html # index.html.erb
		  	format.json do 
		  		# binding.pry
		  		render json: saved_articles 
		  	end
		 	end

		else
			redirect_to sign_up_path		
		end
	end

end
