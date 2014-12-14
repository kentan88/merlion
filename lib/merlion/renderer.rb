class Merlion::Renderer
  attr_reader :env

  def initialize env
    @env = env
  end

  def render(path, opts = {})
    Merlion::Response.new.tap do |response|
      response.body = render_layout.render(self) { render_template(path).render(self) }
      response.status_code = 200
    end
  end

  def render_layout
    Tilt::HamlTemplate.new(File.join('app', 'views', 'layouts', 'application.html.haml'))
  end

  def render_template(path)
    Tilt::HamlTemplate.new(File.join('app', 'views') + '/' + path + '.html.haml')
  end
end
