class User < ActiveRecord::Base
	has_many :articles, through: :saved_articles
	has_many :saved_articles

	has_many :followers, through: :follower_follows, source: :follower, class_name: "Follow"
	has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"

	has_many :followees, through: :followee_follows, source: :followee, class_name: "Follow"
	has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"
end
