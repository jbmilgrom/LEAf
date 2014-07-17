class ArticlesController < ApplicationController

  def index

    # user owner of the saved_articles
    # @user = User.find(params[:user_id])
    # current_user is the viewer of the page
    redirect_to sign_up_path and return unless current_user
    ####TODO### need to only call @user.update_articles if @user == current_user
    # binding.pry
    current_user.update_articles	
    #### UPDATE DOES NOT WORK QUICK ENOUGH TO GET INTO @SAVED_ARTICLES ON FIRST LOAD	
    # binding.pry
			# @user = User.find(params[:id])
			# @user = current_user
    @articles_with_user = current_user.articles_with_user

    # binding.pry
    respond_to do |format|
		  format.html # index.html.erb
      # format.json { binding.pry ; render json: saved_articles }
		  format.json { render json: @articles_with_user }
    end
  end

  def destroy
    user = User.find(params[:user_id])
    article = Article.find(params[:id])
    saved_article = SavedArticle.where(user_id: user.id, article_id: article.id).first

    saved_article.destroy

    respond_to do |format|
      format.json { render json: saved_article }  
    end
  end 

end
