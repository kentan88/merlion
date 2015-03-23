module Merlion
  class Application
    attr_reader :router
    def initialize
      declare_global_variables
      handle_requires
      instantiate_router
    end

    def declare_global_variables
      $AUTOLOAD_PATH = []
    end

    def handle_requires
      ["/app/config/initializers", "/app/models"].each do |dir|
        $AUTOLOAD_PATH.unshift(Dir.pwd + dir)
      end

      $AUTOLOAD_PATH.each do |load_path|
        Dir[load_path + "/**/*"].each do |file|
          require file if File.extname(file) == '.rb'
        end
      end
    end

    def instantiate_router
      @router = Merlion::Router.new
    end
  end
end
