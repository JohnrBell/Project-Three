class PArticlesController < ApplicationController

	def index
		pending = P_Article.all
		render(:index, { locals: { pending: pending} })
	end

	def create
		P_Article.create({title: params[:title], img_url: params[:img_url]})
		render :nothing => true 
	end

	def	destroy
		idtokill = params[:id].to_i
		P_Article.destroy(idtokill)
		render :nothing => true 
	end

end