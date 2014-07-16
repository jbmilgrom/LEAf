class FollowersController < ApplicationController

	def followers
	  user = User.find(params[:user_id])
    redirect_to sign_up_path and return unless current_user == user
    # followers = user.followers
    @followers_with_user = user.followers_with_user 
	end

end
