class DFA < Struct.new(:current_state, :accept_states, :rule_book)
  def accepting?
    accept_states.include?(current_state)
  end

  def read_character
    self.current_state = rule_book.next_state(current_state, character)
  end

  def read_string(string)
    string.chars.each do |charcter|
      read_character charcter
    end
  end
end
