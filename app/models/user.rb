class User < ActiveRecord::Base
	has_many :articles, through: :saved_articles
	has_many :saved_articles

	# source: :follower matches with the belong_to :follower identification in the Follow model 
	has_many :followers, through: :follower_follows, source: :follower, class_name: "Follow"
	# follower_follows "names" the Follow joiner table for accessing through the follower association
	has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"

	# source: :followee matches with the belong_to :followee identification in the Follow model 	
	has_many :followees, through: :followee_follows, source: :followee, class_name: "Follow"
	# followee_follows "names" the Follow joiner table for accessing through the followee association
	has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"

end
