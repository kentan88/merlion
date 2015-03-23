['extensions/object.rb', 'application.rb', 'router.rb', 'route.rb',
'renderer.rb', 'controller.rb', 'response.rb'].each do |filename|
  # require_relative '../lib/merlion/' + filename
  require File.join(File.dirname(__FILE__), 'merlion', filename)
end

module Merlion
end
