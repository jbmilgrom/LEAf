class User < ActiveRecord::Base
	has_many :articles, through: :saved_articles
	has_many :saved_articles

	# source: :follower matches with the belong_to :follower identification in the Follow model 
	has_many :followers, through: :follower_follows, source: :follower
	# follower_follows "names" the Follow joiner table for accessing through the follower association
	has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"

	# source: :followee matches with the belong_to :followee identification in the Follow model 	
	has_many :followees, through: :followee_follows, source: :followee
	# followee_follows "names" the Follow joiner table for accessing through the followee association
	has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"


  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.hashed_password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


  def update_articles
    unless self.any_new_posts[0] == nil
      @users_posts.each do |user_post|
        if user_post.an_article
          SavedArticle.save_article(self, user_post.an_article)
        else
          article = Article.create_article(user_post)
          # binding.pry
          SavedArticle.save_article(self, article) 
        end
      end
    end
  end

  # private

  def any_new_posts
    @users_posts = Post.where(email: self.email)
    
    # delete all user posts that have already been turned into SaveArticles
    @users_posts.each do |user_post|
      self.articles.each do |article|
        @users_posts.delete(user_post) if article.post_id == user_post.id
      end
    end
    return @users_posts
  end

end
