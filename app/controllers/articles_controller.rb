class ArticlesController < ApplicationController

def index

@articles = Article.all

end




def create




end




def view

@article = Article.find(params[:id])


end




end