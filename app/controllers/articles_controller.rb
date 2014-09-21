class ArticlesController < ApplicationController

  def index

    redirect_to sign_up_path and return unless current_user 

    statsd.increment('web.page_views')
    # render_page

    @user = User.find(params[:user_id])
    if @user != current_user
      redirect_to user_articles_path(current_user.id) and return unless current_user.a_follower?(@user)
    end
      ####TODO### need to only call @user.update_articles if @user == current_user      
      
    @user.update_articles
    #### UPDATE DOES NOT WORK QUICK ENOUGH TO GET INTO @SAVED_ARTICLES ON FIRST LOAD	

    # this method merges articles hash with a hash that stores user and current_user
    @articles_with_users = @user.articles_with_user_and(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles_with_users }
    end
  end

  def create
    # parent user in route (i.e. user/42/article) will be the user that
    # is trying to create a SavedArticle in this method
    # current_user should also be this user
    # think about where to redirect as well as the notice message 
    # in the case that current_user != user
    user = User.find(params[:user_id])
    article = Article.find(params[:article_id])

    redirect_to sign_up_path and return unless current_user == user

    #### TO DO ######
    # provide a notice of some sort when discoverable User 
    # is followed and removed from page
    #################

    saved_article = SavedArticle.create!({article_id: article.id, user_id: user.id})

    respond_to do |format|
      format.json { render json: saved_article}
    end
  end


  def destroy
    user = User.find(params[:user_id])
    redirect_to sign_up_path and return unless current_user 
    
    ###### TO DO ######
      # Although the delete button has been removed for user != c_s, 
      # sthink about keeping the below protection in here somehow
      # redirect_to user_articles_path(current_user) and return unless current_user == user
    
    article = Article.find(params[:id])
    saved_article = SavedArticle.where(user_id: user.id, article_id: article.id).first
    post = Post.where({email: user.email, a_url: article.a_url}).first
    
    # must also delete originating posts or update_articles will regenerate a SavedArticle
    # think about deleting posts the instance they are turned into an Article
    
    ##### TO DO #####
    # need to change the update_articles method so that it doesnt pull from all posts
    # this would allow us not to have to destroy posts
    #################

    post.destroy if post
    saved_article.destroy

    respond_to do |format|
      format.json { render json: saved_article }  
    end
  end 

end
