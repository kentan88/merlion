class ArticlesController < Merlion::Controller
  def index
    # @name = "Ken Tan"
    # @articles = DB[:articles]
    # @articles.insert(:name => 'abc', :price => rand * 100)
    # render 'articles/index'
  end

  def new
    @article = Article[1]
    render 'articles/new'
  end

  def show
    render 'articles/show'
  end

  def create
    article_id = DB[:articles].insert(:name => 'abc', :price => rand * 100)
    redirect_to article_id.to_s
  end
end
