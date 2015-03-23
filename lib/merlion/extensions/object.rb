class Object
  def self.const_missing(name)
    Object.const_set(name.to_s.capitalize, Module.new)
  end
end
