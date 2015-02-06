class SubcommentsController < ApplicationController

	def create
		subcomment = Subcomment.create(text: params[:content],
								user_id: session[:user_id],
								comment_id: params[:comment_id])
		redirect_to(:back)
	end


end