class FolloweesController < ApplicationController

	def discover
    user = User.find(params[:user_id])
    redirect_to sign_up_path and return unless current_user == user
    # need to send discoverable_users as well as owner (i.e. current_user)
    @discoverable_users_with_user = user.discoverable_users_with_user
  end


  def index
    user = User.find(params[:user_id])
    redirect_to sign_up_path and return unless current_user == user
    
    # need to send followees as well as owner (i.e. current_user)
    @followees_with_user = user.followees_with_user 
	end

	def destroy
    user = User.find(params[:user_id])
    followee = User.find(params[:id])
    follow = Follow.where(follower_id: user.id, followee_id: followee.id).first
	
    follow.destroy 

    respond_to do |format|
      format.json { render json: follow }
    end
  end

  def create
    # binding.pry
    user = User.find(params[:user_id])
    followee = User.find(params[:followee_id])
    # followee = params[]


    #### TO DO ######
    # currently using .create! because there is no UI protection
    # again c_u folowing a User more than once
    # need to do that
    #################
    
    follow = Follow.create!(follower_id: user.id, followee_id: followee.id)
    # redirect_to user_followees_path(user)
    # responding with followee (instead of follow) b/c User models are the resource (not the joiner table)
    respond_to do |format|
      format.json { render json: followee }
    end
  end

  private 

  def followee_params
    params.require(:follow).permit(:followee_id, :follower_id)
  end

end
