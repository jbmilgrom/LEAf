class User < ActiveRecord::Base
	has_many :articles, through: :saved_articles
	has_many :saved_articles

	# source :follower matches with the follower belong_to identification in the Follow model 
	has_many :followers, through: :follower_follows, source: :follower, class_name: "Follow"
	# "name" of Follow joiner table when accessing through the followers associations
	has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"

	# source :followee matches with the followee belong_to identification in the Follow model 	
	has_many :followees, through: :followee_follows, source: :followee, class_name: "Follow"
	# "name" of Follow joiner table when accessing through the followers associations
	has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"

end
