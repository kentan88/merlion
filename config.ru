require 'bundler'
Bundler.require

require 'tilt/haml'

DB = Sequel.sqlite

DB.create_table :items do
  primary_key :id
  String :name
  Float :price
end

require File.join(File.dirname(__FILE__), 'lib', 'merlion')
Dir[File.dirname(__FILE__) + '/app/models/*.rb'].each {|file| require file }

Application = Merlion::Application.new
run Merlion::Controller.new

# find merlion -name '*' | xargs wc -l
