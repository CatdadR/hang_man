class Display
  
  def board_state(guess)
    case guess
    when 7 
      puts('  
            +---+
                |
                |
                |
                |
                |
          =========')
    when 6
      puts('    
            +---+
            |   |
                |
                |
                |
                |
          =========')
    when 5 
      puts('    
            +---+
            |   |
            O   |
                |
                |
                |
          =========')
    when 4
      puts('    
            +---+
            |   |
            O   |
            |   |
                |
                |
          =========')
    when 3
      puts('   
            +---+
            |   |
            O   |
           /|   |
                |
                |
          =========')
    when 2
      puts('    
            +---+
            |   |
            O   |
           /|\  |
                |
                |
          =========')
    when 1
      puts('    
            +---+
            |   |
            O   |
           /|\  |
           /    |
                |
          =========')
    when 0
      puts('    
            +---+
            |   |
            O   |
           /|\  |
           / \  |
                |
          =========')
    end
  end
end

