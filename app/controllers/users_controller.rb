class UsersController < ApplicationController

	def discover
    user = User.find(params[:id])
    redirect_to sign_up_path and return unless current_user == user
    # need to send discoverable_users as well as owner (i.e. current_user)
    @discoverable_users_with_user = user.discoverable_users_with_user
	end

	def new
  	@user = User.new
	end

	def create
		@user = User.new(user_attributes)
		if @user.save
			session[:user_id] = @user.id
  		redirect_to root_url, :notice => "Signed up!"
		else
  		render "new"
		end
	end


	private

	def user_attributes
  	params.require(:user).permit(:email, :password, :first_name, :last_name)
	end

end
