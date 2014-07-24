class ArticlesController < ApplicationController

  def index

    # user owner of the saved_articles
    user = User.find(params[:user_id])
    # current_user is the viewer of the page
    redirect_to sign_up_path and return unless current_user 
      redirect_to user_articles_path(current_user.id) unless current_user.a_follower?(user)
        ####TODO### need to only call @user.update_articles if @user == current_user
        
        
        current_user.update_articles if user == current_user
        	
        #### UPDATE DOES NOT WORK QUICK ENOUGH TO GET INTO @SAVED_ARTICLES ON FIRST LOAD	
    			# @user = User.find(params[:id])
    			# @user = current_user
        @articles_with_user = user.articles_with_user

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
    post = Post.where({email: user.email, a_url: article.a_url}).first
    # must also delete originating posts or update_articles will regenerate a SavedArticle
    # think about deleting posts the instance they are turned into an Article
    post.destroy
    saved_article.destroy

    respond_to do |format|
      format.json { render json: saved_article }  
    end
  end 

end
