class UsersController < ApplicationController

	def new
  	@user = User.new
	end

	def create
		@user = User.new(user_attributes)
		if @user.save
			session[:user_id] = @user.id
  		redirect_to user_articles_path(@user.id), :notice => "Signed up!"
		else
  		render "new"
		end
	end


	private

	def user_attributes
  	params.require(:user).permit(:email, :password, :first_name, :last_name)
	end

end
