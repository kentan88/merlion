require 'bundler'
Bundler.require

require File.join(File.dirname(__FILE__), 'lib', 'merlion')

Application = Merlion::Application.new
run Merlion::Controller.new
