class Concatenate < Struct.new(:first, :second)
  include Pattern
  def to_s
    [first, second].map { |pattern| pattern.bracket(precedence) }.join
  end

  def precedence
    1
  end

  def to_nfa_design
    first_nfa_design = first.to_nfa_design
    second_nfa_design = second.to_nfa_design

    start_state = first_nfa_design.start_state
    accept_state = second_nfa_design.accept_states
    rules = first_nfa_design.rules + second_nfa_design.rulebook.rules
    extra_rules = first_nfa_design.accept_states.map do |state|
      FARule.new(state, nil, second_nfa_design.start_state)
    end
    rulebook = NFARulebook.new(rule + extra_rules)
    NFADesign.new(start_state, accept_states, rulebook)
  end
end
