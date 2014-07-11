class User < ActiveRecord::Base
	has_many :article, through: :saved_articles
	has_many :saved_articles
end
