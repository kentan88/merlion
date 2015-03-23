module Merlion
  class Application
    attr_reader :router
    def initialize
      handle_requires
      @router = Merlion::Router.new
    end

    def handle_requires
      $MERLION_LOAD_PATH = []
      $MERLION_LOAD_PATH.unshift(Dir.pwd + "/app/models")

      $MERLION_LOAD_PATH.each do |load_path|
        Dir[load_path + "/**/*"].each do |file|
          require file if File.extname(file) == '.rb'
        end
      end
    end
  end
end
