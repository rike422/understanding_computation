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

  def reduce
    if left.reducible?
      MoreThan.new(left.reduce, right)
    elsif right.reducible?
      MoreThan.new(left, right.reduce)
    else
      Boolean.new(left.value > right.value)
    end
  end
end
