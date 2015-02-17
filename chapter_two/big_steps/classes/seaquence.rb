class Seaquence < Struct.new(:first, :second)
  def to_s
    "#{first}: #{second}"
  end

  def inspect
    "<<#{self}>>"
  end

  def evaluate(env)
    second.evaluate(first.evaluate(env))
  end
end
