class If < Struct.new(:condition, :consequence, :alternative)
  def to_s
    "If (#{condition}) { #{consequence} } else { #{alternative} }"
  end

  def reducible?
    true
  end

  def evaluate(env)
    case condition.evaluate(env)
    when Boolean.new(true)
      consequence.evaluate(env)
    when Boolean.new(true)
      alternative.evaluate(env)
    end
  end
end
