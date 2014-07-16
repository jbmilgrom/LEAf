class Article < ActiveRecord::Base
	has_many :users, through: :saved_articles
	has_many :saved_articles

 	has_one :post


	def self.create_article(post)
    # url = post.a_url
    
    processed_article = ArticleProcessor.new(post.a_url)
    # binding.pry
    if processed_article
      Article.create({
        a_url: post.a_url,
        header: processed_article.title,
        subheader: processed_article.sentences(5),
        body: processed_article.body,
        post_id: post.id
        })
    else
      Article.create({
        a_url: post.a_url,
        post_id: post.id
        })
    end
	end



end
