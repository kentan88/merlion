module Merlion
  class Application
    attr_reader :router
    def initialize
      init_global_var
      handle_requires
      instantiate_router
    end

    def init_global_var
      $ROOT_PATH = Dir.pwd
      $AUTOLOAD_PATH = []
    end

    def handle_requires
      ["/app/config/initializers", "/app/models"].each do |dir|
        $AUTOLOAD_PATH.unshift($ROOT_PATH + dir)
      end

      $AUTOLOAD_PATH.each do |load_path|
        Dir[load_path + "/**/*.rb"].each do |file|
          pathname = file.gsub(load_path, '')

          # set_constant(pathname)

          require file if File.extname(file) == '.rb'
        end
      end
    end

    def set_constant(string)
      #  load all the string according to their namespaces!
      # Object.const_missing(string)
    end

    def instantiate_router
      @router = Merlion::Router.new
    end
  end
end

['extensions/object.rb', 'router.rb', 'route.rb',
'renderer.rb', 'controller.rb', 'response.rb'].each do |filename|
  # require_relative '../lib/merlion/' + filename
  require File.join(File.dirname(__FILE__), 'merlion', filename)
end
