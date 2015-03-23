class Object
  def self.const_missing(name)
    Object.const_set(name.to_s.capitalize, Module.new)
  end
end

require File.join(File.dirname(__FILE__), 'merlion', 'application')
require File.join(File.dirname(__FILE__), 'merlion', 'router')
require File.join(File.dirname(__FILE__), 'merlion', 'route')
require File.join(File.dirname(__FILE__), 'merlion', 'renderer')
require File.join(File.dirname(__FILE__), 'merlion', 'controller')
require File.join(File.dirname(__FILE__), 'merlion', 'response')

module Merlion
end
