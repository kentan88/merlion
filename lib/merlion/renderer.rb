class Merlion::Renderer
  attr_reader :env

  def initialize env
    @env = env
  end

  def render(path, opts = {})
    Merlion::Response.new.tap do |response|
      response.body = render_layout(path)
      response.status_code = 200
    end
  end

  def redirect_to(path)
    Merlion::Response.new.tap do |response|
      response.body = "redirecting..."
      response.headers['location'] = path
      response.status_code = 301
    end
  end

  def render_layout(path)
    Tilt::HamlTemplate.new(File.join('app', 'views', 'layouts', 'application.html.haml')).render(self) do
      render_template(path)
    end
  end

  def render_template(path)
    Tilt::HamlTemplate.new(File.join('app', 'views') + '/' + path + '.html.haml').render(self)
  end
end
