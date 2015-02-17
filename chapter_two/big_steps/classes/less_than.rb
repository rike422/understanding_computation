class LessThan < Struct.new(:left, :right)
end

class LessThan
  def to_s
    "#{left} < #{right}"
  end

  def inspect
    "<< #{self} >>"
  end

  def evaluate(env)
    Boolean.new(left.evaluate(env).value < right.evaluate(env).value)
  end
end
