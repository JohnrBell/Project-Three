class UsersController < ApplicationController

	def index #user login page, also has a link to sign up as a new user
		# binding.pry
		if session[:user_id] != nil
			redirect_to '/articles'
		else
			render :index
		end
	end


	def new #new user sign up page, renders new.html.erb
	end


	def create #creates new user when user hits submit button in the sign up page
		if params["email"] == "admin@admin.com" || params["name"] == "admin" #if a user tries to sign up as an admin by admin email or username admin, @error = true, which renders an error message on the html page (see index.html.erb)
			@error = true
			render :new
		else
			new_user = User.new({name: params["name"], email: params["email"], password: params[:password]})
			new_user.save
			redirect_to '/articles'
		end
 	end

 	def view
 		if session[:user_id] == (params[:id].to_i)
 			user = User.find_by(id: params[:id])
			render(:view, { locals: {user: user}})
		else
			redirect_to '/'
		end
 	end

end
