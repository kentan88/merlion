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
    klass.new.send(instance_method.to_sym)
    # klass.new(env).send(instance_method.to_sym)
  end

  def handle_requires
    require File.expand_path('app/controllers/' + klass_name.downcase + '_controller.rb')
  end
end
