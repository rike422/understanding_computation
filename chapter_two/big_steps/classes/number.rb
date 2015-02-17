class Number < Struct.new(:value)
end

class Number
  def to_s
    value.to_s
  end

  def inspect
    "<< #{value} >>"
  end

  def evaluate(env)
    self
  end
end
