class Article < ActiveRecord::Base
	has_many :users, through: :saved_articles
	has_many :saved_articles

 	has_one :post

end
