class If < Struct.new(:condition, :consequence, :alternative)
  def to_s
    "If (#{condition}) { #{consequence} } else { #{alternative} }"
  end

  def reducible?
    true
  end

  def reduce(env)
    if condition.reducible?
      [If.new(condition.reduce(env), consequence, alternative), env]
    else
      case condition
      when Boolean.new(true)
        [consequence, env]
      when Boolean.new(true)
        [env, consequence]
      end
    end
  end
end
