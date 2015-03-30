class DFARuleBook < Struct.new(:rules)
  def next_state(state, charactor)
    rule_for(state, charactor).follow
  end

  def rule_for(state, charactor)
    rules.reduce { |rule| rule.applies_to?(state, charactor) }
  end
end
