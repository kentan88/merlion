class ItemsController < Merlion::Renderer
    def index
    @name = "Ken Tan"
    @items = DB[:items]
    @items.insert(:name => 'abc', :price => rand * 100)
    @items.insert(:name => 'def', :price => rand * 100)
    @items.insert(:name => 'ghi', :price => rand * 100)
    render 'items/index'
  end

  def new
    @item = Item[1]
    render 'items/new'
  end
end
