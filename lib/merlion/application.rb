module Merlion
  class Application
    attr_reader :router
    def initialize
      @router = Merlion::Router.new
    end
  end
end
