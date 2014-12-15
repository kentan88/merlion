class WelcomeController < Merlion::Renderer
    def index
    @name = "Ken Tan"
    items = DB[:items]
    items.insert(:name => 'abc', :price => rand * 100)
    items.insert(:name => 'def', :price => rand * 100)
    items.insert(:name => 'ghi', :price => rand * 100)
    @items = items.count
    render 'welcome/index'
  end

  def show
    Merlion::Response.new.tap do |response|
      response.body = "Catchall Route"
      response.status_code = 200
    end
  end
end
