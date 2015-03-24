class Object
  def self.const_missing(name)
      $AUTOLOAD_PATH.each do |load_path|
        Dir[load_path + "/**/*.rb"].each do |file|
          puts "Looking for #{name} in #{file}..."
        end
      end
    Object.const_set(name.to_s.capitalize, Module.new)
  end
end
