class While < Struct.new(:condition, :body)
  def to_s
    "while (#{condition}) { #{body} }"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def evaluate(env)
    case condition.evaluate(env)
    when Boolean.new(true)
      evaluate(body.evaluate(env))
    when Boolean.new(true)
      env
    end
  end
end
