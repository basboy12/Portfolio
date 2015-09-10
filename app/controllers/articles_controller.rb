class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]
	def index
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new article_params
		if @article.save
			redirect_to @article, notice: "Article succesfully saved!"
		else
			render 'new', notice: "Something went wrong, try again!"
		end
	end

	def show		
	end

	def edit
	end

	def update
		if @article.update article_params
			redirect_to @article, notice: "The article is succesfully updated"
		else
			render 'edit'
		end
	end

	def destroy		
		@article.destroy
		redirect_to root_path
	end

	private

	def article_params
		params.require(:article).permit(:title, :content)
	end

	def find_article
		@article = Article.find(params[:id])
	end
end
