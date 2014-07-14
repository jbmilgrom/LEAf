class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	helper_method :current_user

	private

	# The session hash receives the key value pair of {:user_id => id_of_a_user} when a user signs up through (i) the '/sign_up' get request and (ii) the '/log_in' get request.
	# The "session" is only destroyed (i.e session[:user_id] = nil) when the user sends a get request to '/log_out'
	# Calling current_user in any descendent controller returns a User instance unless the key value pair of {:user_id => id_of_a_user} has yet to be introduced into the session hash.  
	# The 'session' hash persists through multiple http requests - the whole point!
	def current_user
		# The outer () w.r.t. the 'if' statement do not doing anything in ruby land (i.e. they are implied anyway). I've left them in for clarity.
		( @current_user ||= User.find(session[:user_id]) ) if session[:user_id]
	end
end
