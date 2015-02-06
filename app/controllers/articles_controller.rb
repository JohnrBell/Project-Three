class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def create
		binding.pry
		# Article.create({title: params[:title], img_url: params[:img_url]})
		render :nothing => true
	end

	def view
		@article = Article.find(params[:id])
		@comments = Comment.find_by(article_id: params[:id])

	end

end
