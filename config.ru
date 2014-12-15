require 'bundler'
Bundler.require

require 'tilt/haml'

# use Rack::Static,
#   :urls => ["/images", "/js", "/css"],
#   :root => "public",
#   :index => 'index.html'

require File.join(File.dirname(__FILE__), 'lib', 'merlion')
Application = Merlion::Application.new
run Merlion::Controller.new
