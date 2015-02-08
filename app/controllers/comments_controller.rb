class CommentsController < ApplicationController

	def create
		comment = Comment.create(text: params[:commentText],
								user_id: session[:user_id],
								article_id: params[:id])
		redirect_to "/articles/#{params[:id]}/#bottom"
	end

end