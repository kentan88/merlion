module Merlion
  class Application
    attr_reader :router
    def initialize
      @router = Merlion::Router.new
    end
  end
end

class Merlion::Router
  attr_reader :routes

  def initialize
    @routes = Hash.new { |hash, key| hash[key] = [] }
  end

  def draw &block
    instance_eval &block
  end

  def get path, options = {}
    @routes[:get] << [path, parse_to(options[:to])]
  end

  def route_for env
    path = env["PATH_INFO"]
    method = env["REQUEST_METHOD"].downcase.to_sym
    route_array = routes[method].detect do |route|
      case route.first
      when String
        path == route.first
      when Regexp
        path =~ route.first
      end
    end
    return Merlion::Route.new(route_array) if route_array
    return nil #No route matched
  end

  private
  def parse_to to_string
    klass, method = to_string.split("#")
    {:klass => klass.capitalize, :method => method}
  end
end


class Merlion::Route
    attr_accessor :klass_name, :path, :instance_method

  def initialize(route_array)
    @path = route_array.first
    @klass_name = route_array.last[:klass]
    @instance_method = route_array.last[:method]
    handle_requires
  end

  def klass
    Module.const_get(klass_name + 'Controller')
  end

  def execute(env)
    klass.new(env).send(instance_method.to_sym)
  end

  def handle_requires
    # require File.join(File.dirname(__FILE__), '../', '../', 'app', 'controllers', klass_name.downcase + '_controller.html.haml')

    # require File.expand_path('../../app/controllers/' + klass_name.downcase + '_controller.html.haml', __FILE__)

    require File.join(File.dirname(__FILE__), '../', 'app', 'controllers', klass_name.downcase + '_controller.rb')


  end
end

class Merlion::Controller
  def initialize
    handle_requires
  end

  def handle_requires
    require File.expand_path('../../app/config/routes', __FILE__)
  end

  def call(env)
    route = Application.router.route_for(env)
    if route
      response = route.execute(env)
      return response.rack_response
    else
      return [404, {}, []]
    end
  end
end


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

class Merlion::Response
  attr_accessor :status_code, :headers, :body

  def initialize
    @headers = {}
  end

  def rack_response
    [status_code, headers, Array(body)]
  end
end
