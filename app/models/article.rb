class Article < ActiveRecord::Base
	has_many :users, through: :saved_articles
	has_many :saved_articles

 	has_one :post


	def self.create_article(post)       
    article = ArticleProcessor.new(post.a_url)
    Article.create({
      a_url: post.a_url,
      header: article.title,
      subheader: article.sentences(5),
      body: article.body,
      post_id: post.id,
      received?: article.received?
    })
	end

end
