class NFA < Struct.new(:current_states, :accept_states, :rule_book)
  def accepting?
    (current_states & accept_states).any?
  end

  def read_character
    self.current_states = rule_book.next_state(current_state, character)
  end

  def read_string(string)
    string.chars.each do |charcter|
      read_character charcter
    end
  end

  def current_state
    rulebook.follow_free_moves(states)
  end
end
