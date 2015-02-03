class MoreThan < Struct.new(:left, :right)
end

class MoreThan
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

  def reduce(env)
    if left.reducible?
      MoreThan.new(left.reduce(env), right)
    elsif right.reducible?
      MoreThan.new(left, right.reduce(env))
    else
      Boolean.new(left.value > right.value)
    end
  end
end
