class Merlion::Controller
  def initialize
    handle_requires
  end

  def handle_requires
    require File.expand_path('../../../app/config/routes', __FILE__)
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
