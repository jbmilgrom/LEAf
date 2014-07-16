class FollowersController < ApplicationController

	def index
	user = User.find(params[:user_id])
    redirect_to sign_up_path and return unless current_user == user
    # followers = user.followers
    @followers_with_user = user.followers_with_user 
	end

	def destroy
    user = User.find(params[:user_id])
    follower = User.find(params[:id])
    follow = Follow.where(followee_id: user.id, follower_id: follower.id).first
    follow.destroy 

    respond_to do |format|
      format.json { render json: follow }
    end
  end

end
