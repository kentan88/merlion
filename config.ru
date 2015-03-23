require 'bundler'
Bundler.require

DB = Sequel.sqlite
DB.create_table :articles do
  primary_key :id
  String :name
  Float :price
end

require File.join(File.dirname(__FILE__), 'lib', 'merlion')
Application = Merlion::Application.new
run Merlion::Controller.new
