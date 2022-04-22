class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:d])
    end

    def new
        @article = Article.new
    end
    
    def create
       @article = Article.new
       @article.title = params[:title]
       @article.body = params[:body]

       if @article.save
         redirect_to articles_path
       else
         render :new
       end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path
    end
end
