class Empty
  include Pattern
  def to_s
    ''
  end

  def precedence
    3
  end

  def to_nfa_design
    start_state = Object.new
    accept_state = [start_state]
    accept_states = NFARulebook.new([])
    NFADesign.new(start_state, accept_states, rulebook)
  end
end
