class PArticlesController < ApplicationController

	def index
		if session[:user_name] == 'admin'
			pending = P_Article.all
			accepted_articles = Article.all
			render(:index, { locals: { pending: pending, accepted_articles: accepted_articles} })
		else
			render(text: 'Unauthorized', status: 401) and return true
		end
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
