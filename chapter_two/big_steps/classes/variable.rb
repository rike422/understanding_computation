class Variable < Struct.new(:name)
  def to_s
   name.to_s
  end

  def inspect
    "<< #{name} >>"
  end

  def evaluate(env)
    env[name]
  end
end
