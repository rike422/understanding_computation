class Boolean < Struct.new(:value)
end

class Boolean
  def to_s
    value.to_s
  end

  def inspect
    "<< #{value} >>"
  end

  def reducible?
    false
  end

  def atom?
    !reducible?
  end

  def evaluate(env)
    self
  end
end
