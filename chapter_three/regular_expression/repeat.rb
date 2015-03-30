class Repeat < Struct.new(:pattern)
  include Pattern
  def to_s
    pattern.bracket(precedence) + '+'
  end

  def precedence
    2
  end

  def to_nfa_design
    pattern_nfa_design = pattern.to_nfa_design

    start_state = Object.new
    accept_state = pattern_nfa_design.accept_states + [start_state]
    rules = pattern_nfa_design.rulebook.rules

    extra_rules =
      pattern_nfa_design.accept_states.map do |accept_state|
        FARule.new(accept_state, nil, pattern_nfa_design.start_state)
      end +
      [FARule.new(start_state, nil, pattern_nfa_design.start_state)]
    rulebook = NFARulebook.new(rule + extra_rules)
    NFADesign.new(start_state, accept_states, rulebook)
  end
end
