class ArticlesController < ApplicationController

  def index

    redirect_to sign_up_path and return unless current_user 

    @user = User.find(params[:user_id])

    if @user != current_user
      redirect_to user_articles_path(current_user.id) and return unless current_user.a_follower?(@user)
    end
      ####TODO### need to only call @user.update_articles if @user == current_user
      
      
    @user.update_articles
    	
    #### UPDATE DOES NOT WORK QUICK ENOUGH TO GET INTO @SAVED_ARTICLES ON FIRST LOAD	

    @articles_with_user = @user.articles_with_user

    respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @articles_with_user }
    end
  end

  def destroy
    user = User.find(params[:user_id])
    binding.pry
    redirect_to sign_up_path and return unless current_user 
    ###### TO DO ######
    ##### THIS is creating a DELETE request to the desired path for some strange reason
    ##### There is no impact at the moment because the DELETE button has been removed when c_u != user
    redirect_to user_articles_path(current_user) and return unless current_user == user
    
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
