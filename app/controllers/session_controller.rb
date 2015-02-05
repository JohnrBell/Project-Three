class SessionController < ApplicationController

	def create #creates new 'session' when existing user wants to login
		user = User.find_by(email: [params["email"]) #checks the database for user email

		if user && user.authenticate(params["password"]) #if user email exists, and password is legit
			session[:user_id] = user.id #sets the session hash user_id to user.id
			redirect_to '/articles' #redirects user to article page for image overload
		else
			@error = true
			render :new
		end
	end

	def destroy #logout, destroys session and redirects user to login page
		reset_session
		redirect_to '/'
	end

end