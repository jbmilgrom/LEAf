class User < ActiveRecord::Base
	has_many :articles, through: :saved_articles
	has_many :saved_articles

	# source: :follower matches with the belong_to :follower identification in the Follow model 
	has_many :followers, through: :follower_follows, source: :follower
	# follower_follows "names" the Follow join table for accessing through the follower association
	has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"

	# source: :followee matches with the belong_to :followee identification in the Follow model 	
	has_many :followees, through: :followee_follows, source: :followee
	# followee_follows "names" the Follow join table for accessing through the followee association
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

  def a_follower?(followee)
    self.followees.include? followee
  end

  def update_articles
    new_user_posts = self.any_new_posts
    unless new_user_posts[0] == nil

      new_user_posts.each do |user_post|
        # match each Post's url with any previously created Article
        # we do this to avoid scraping the same web page more than once and creating duplicate Articles
        if user_post.an_article
          SavedArticle.save_article(self, user_post.an_article)
        else
          # Any new post (i.e. any url that hasn't already been scrapped and turning into an Article) is turned into an Article (through Pismo processing)
          # Then the Article is linked to the User through creation of a SavedArticle
          article = Article.create_article(user_post)
          SavedArticle.save_article(self, article) 
        end
      end
    end
  end

  # private

  def any_new_posts
    posts = Post.where(email: self.email).to_a
    # Deletes all of the user's posts that have already been turned into Articles and linked to the User (through a SavedArticle)
    # Note that if a User posts an article more than once (even months apart), such post will not be send to def update_articles, and no additioonal SavedArticle will be created
    # In other words, we may want to change the below to allow a user to email himself an article more than once
    # Then again, doing so would not filter out accidental diplicate emails/posts
    self.articles.each do |article|
      posts.delete_if { |post| ( article.post_id == post.id ) || ( article.a_url == post.a_url ) }
    end
    return posts
  end

  def serializable_hash(options = nil)
    {id: id, first_name: first_name, last_name: last_name, picture: picture}
  end

end
