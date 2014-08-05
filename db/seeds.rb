User.delete_all
Follow.delete_all
SavedArticle.delete_all
Article.delete_all
Post.delete_all

user_info = [
	{email: "jbmilgrom@gmail.com", first_name: "Jonathan", last_name: "Milgrom"}, 
	{email: "nelson.schubart@gmail.com", first_name: "Nelson", last_name: "Schubart"}, 
	{email: "dmdehrey@gmail.com", first_name: "Daniel", last_name: "Dehrey"}, 
	{email: "idangurel@gmail.com", first_name: "Idan", last_name: "Gurel"}, 
	{email: "hannaemma4@gmail.com", first_name: "Hanna", last_name: "Alster"}, 
	{email: "hannah.milgrom@gmail.com", first_name: "Hannah", last_name: "Milgrom"}, 
	{email: "srmilgrom@gmail.com", first_name: "Sarah", last_name: "Milgrom"}
]

@users = []
user_info.each do |user|
	@users << User.create({
		email: user[:email],
		password: "password123",
		first_name: user[:first_name],
		last_name: user[:last_name]
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




