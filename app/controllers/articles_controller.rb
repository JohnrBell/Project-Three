class ArticlesController < ApplicationController

	def index
		if session[:user_id] != nil
			@articles = Article.all
		else
			redirect_to '/'
		end
	end

	def create
		Article.create({title: params[:title], img_url: params[:img_url]})
		render :nothing => true
	end

	def view
		if session[:user_id] != nil
			articles = Article.find_by(id: params[:id])
			comments = Comment.where(article_id: params[:id])
			render(:view, { locals: { articles: articles, comments: comments}})
		else
			redirect_to '/'
		end
	end

	def destroy
		idtokill = params[:id].to_i
		Article.destroy(idtokill)
		render :nothing => true
	end

end
