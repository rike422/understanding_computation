require 'set'

class NFARuleBook < Struct.new(:rules)
  def next_state(state, character)
    states.flat_map { |state| follow_rules_for(state, character) }.to_set
  end

  def follow_rules_for(state, character)
    rules_for(state, character).map(&:follow)
  end

  def rule_for(state, character)
    rules.select { |rule| rule.applies_to?(state, character) }
  end
end
