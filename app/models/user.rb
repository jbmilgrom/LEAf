class User < ActiveRecord::Base
	has_many :articles, through: :saved_articles
	has_many :saved_articles
end
