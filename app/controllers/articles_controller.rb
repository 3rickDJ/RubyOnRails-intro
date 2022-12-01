class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  # create but does not save it
  # useful in the view
  def new
    # render
    # app/view/articles/new.html.erb
    @article = Article.new
  end
  # instantiate a new article and attempts to save it
  def create
    @article = Article.new(article_params)
    if @article.save
      #localhost:port/articles/#{@article.id}
      redirect_to @article
    else
      #render form
      # app/views/articles/new.html.erb
      # with status code 422
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :uprocessable_entity
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
