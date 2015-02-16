class Variable < Struct.new(:name)
  def to_s
   name.to_s
  end

  def inspect
    "<< #{name} >>"
  end

  def reducible?
    true
  end

  def atom?
   !reducible?
  end

  def reduce(env)
    env[name]
  end
end
