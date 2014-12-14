class WelcomeController < Merlion::Renderer
    def index
    @name = "Ken Tan"
    # @post = User.new.create(:post)
    render 'welcome/index'
  end

  def show
    Merlion::Response.new.tap do |response|
      response.body = "Catchall Route"
      response.status_code = 200
    end
  end
end
