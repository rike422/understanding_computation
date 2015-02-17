class Multiply < Struct.new(:left, :right)
end

class Multiply
  def to_s
    "#{left} * #{right}"
  end

  def inspect
    "<< #{self} >>"
  end

  def evaluate(env)
    Number.new(left.evaluate(env).value * right.evaluate(env).value)
  end

end
