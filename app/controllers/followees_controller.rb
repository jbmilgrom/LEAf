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
    binding.pry
    user = User.find(params[:user_id])
    # followee = params[]
    # follow = Follow.create!()
    # redirect_to user_followees_path(user)
     respond_to do |format|
      format.json { render json: follow }
    end
  end

  private 

  def followee_params
    params.require(:follow).permit(:followee_id, :follower_id)
  end

end
