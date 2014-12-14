# require 'bundler'
# Bundler.require

require 'rack'
require 'haml'
# require 'tilt/haml'

require File.join(File.dirname(__FILE__),'lib', 'merlion')

# require File.join(File.dirname(__FILE__),'lib', 'rails')
# require File.join(File.dirname(__FILE__),'lib', 'request_controller')
# Dir[File.dirname(__FILE__) + '/app/models/*.rb'].each {|file| require file }

Application = Merlion::Application.new
run Merlion::Controller.new
