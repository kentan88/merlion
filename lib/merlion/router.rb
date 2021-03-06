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

  def post path, options = {}
    @routes[:post] << [path, parse_to(options[:to])]
  end

  def route_for env
    path = env["PATH_INFO"]
    method = env["REQUEST_METHOD"].downcase.to_sym
    route_array = routes[method].detect do |route|
      # when route.first has :, it is a regex
      # wip
      
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
