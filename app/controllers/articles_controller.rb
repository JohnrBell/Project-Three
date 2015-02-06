class ArticlesController < ApplicationController

	def index
		@article = Article.all
	end

	def create
		Article.create({title: params[:title], img_url: params[:img_url]})
		redirect_to '/articles'
	end

	def view
		@article = Article.find(params[:id])
	end

end