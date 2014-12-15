class ItemsController < Merlion::Renderer
    def index
    @name = "Ken Tan"
    @items = DB[:items]
    @items.insert(:name => 'abc', :price => rand * 100)
    render 'items/index'
  end

  def new
    @item = Item[1]
    render 'items/new'
  end

  def create
    render 'items/index'
  end
end
