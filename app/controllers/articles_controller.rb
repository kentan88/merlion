class ArticlesController < Merlion::Renderer
  def index
    @name = "Ken Tan"
    @articles = DB[:articles]
    @articles.insert(:name => 'abc', :price => rand * 100)
    render 'articles/index'
  end

  def new
    @article = Article[1]
    render 'articles/new'
  end

  def create
    redirect_to 'articles/index'
  end
end
