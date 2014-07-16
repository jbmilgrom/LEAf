class FolloweesController < ApplicationController

	def index
    user = User.find(params[:user_id])
    redirect_to sign_up_path and return unless current_user == user
    @followees_with_user = user.followees_with_user 
	end

end
