class LessThan < Struct.new(:left, :right)
end

class LessThan
  def to_s
    "#{left} < #{right}"
  end

  def inspect
    "<< #{self} >>"
  end

  def reducible?
    true
  end

  def atom?
    !reducible?
  end

  def reduce
    if left.reducible?
      LessThan.new(left.reduce(env), right)
    elsif right.reducible?
      LessThan.new(left, right.reduce(env))
    else
      Boolean.new(left.value < right.value)
    end
  end
end
