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
    # dummy values for title and body
    # todo: change for form values
    @article = Article.new(title:"...",body: "...")
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

  private
    def articles_params
      params.require(:article).permit(:title, :body)
    end
end
