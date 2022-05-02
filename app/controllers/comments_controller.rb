class CommentsController < ApplicationController
  before_action :get_article

  def index
    @comments = @article.comments
  end

  def new
    @comment = @article.comments.build
  end
  
  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to article_comments_path
    else
      render :new 
    end 
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
  end

  def edit 
    @comment = @article.comments.find(params[:id])
  end

  def update
    @comment = @article.comments.find(params[:id])
    if @comment.update(comment_params)
       redirect_to article_comments_path
    else
      render :edit
    end
  end

  private
  def get_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
