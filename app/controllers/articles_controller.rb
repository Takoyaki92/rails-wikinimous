class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    # @task.completed =  params[:completed].present?

    @article.save

    redirect_to task_path(@article)
  end

  def edit
     @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    # @task.completed = params[:completed].present?


    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
