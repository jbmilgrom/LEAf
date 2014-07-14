User.delete_all
Follow.delete_all
SavedArticle.delete_all

user_emails = ["jbmilgrom@gmail.com", "nelson.schubart@gmail.com", "dmdehrey@gmail.com", "idangurel@gmail.com", "hannaemma4@gmail.com", "hannah.milgrom@gmail.com", "srmilgrom@gmail.com"]

@users = []
user_emails.each do |email|
	@users << User.create({
		email: email,
		password: "password123"
	})
end

jonathan = @users[0]
nelson = @users[1]

[jonathan, nelson].each do |founder|
	@users.each do |user|
		unless user == founder
			Follow.create ({
					follower_id: founder.id,
					followee_id: user.id
				})
		end
	end
end

