class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def create
		Article.create({title: params[:title], img_url: params[:img_url]})
		render :nothing => true
	end

	def view
		articles = Article.find_by(id: params[:id])
		comments = Comment.where(article_id: params[:id])
		# binding.pry
		render(:view, { locals: { articles: articles, comments: comments} })
	end

end
