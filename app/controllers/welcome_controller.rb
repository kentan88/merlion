class WelcomeController < Merlion::Renderer
    def index
    @name = "Ken Tan"
    @articles = DB[:articles]
    @articles.insert(:name => 'abc', :price => rand * 100)
    @articles.insert(:name => 'def', :price => rand * 100)
    @articles.insert(:name => 'ghi', :price => rand * 100)
    render 'welcome/index'
  end

  def show
    Merlion::Response.new.tap do |response|
      response.body = "Catchall Route"
      response.status_code = 200
    end
  end
end
