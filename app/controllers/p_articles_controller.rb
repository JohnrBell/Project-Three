class PArticlesController < ApplicationController

	def index
		pending = P_Article.all
		render(:index, { locals: { pending: pending} })
	end

	def create
		binding.pry
		P_Article.create({title: params[:title], img_url: params[:img_url]})
	end

	def	destroy

	end

end