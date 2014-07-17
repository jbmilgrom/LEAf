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
  
  validates_confirmation_of :password_salt
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

  def followers_with_user
    { user_id: self.id, followers: self.followers }
  end

  def followees_with_user
    { user_id: self.id, followees: self.followees }
  end

  def discoverable_users_with_user
    { user_id: self.id, discoverable_users: self.discoverable_users }    
  end


  def articles_with_user
    { user_id: self.id, articles: self.articles }
  end

  def discoverable_users
    # TO DO: make more robust discoverable algorithm
    # self.class.where(id: self.id) turns self into [self]
    self.class.all - self.followees - self.class.where(id: self.id)
  end

  def update_articles
    # binding.pry
    new_user_posts = self.any_new_posts
    # binding.pry
    new_user_posts.uniq!
    unless new_user_posts[0] == nil
      # binding.pry
      new_user_posts.each do |user_post|
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

  # remove all posts that are already 
  def any_new_posts
    users_posts = Post.where(email: self.email).to_a
    # binding.pry
    # delete all user posts that have already been turned into SaveArticles
    users_posts.each do |user_post|
      self.articles.each do |article|
        # binding.pry
        users_posts.delete(user_post) if ( (article.post_id == user_post.id) || (article.a_url == user_post.a_url) )
        # binding.pry
      end
    end
    # binding.pry
    return users_posts
  end

end
