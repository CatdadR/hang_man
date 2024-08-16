require_relative 'event_manager'

class GameHandler 

  def initialize

  end
  
  def new_game(event_manager, display)
    secret_word = event_manager.word_dictionary.sample
    display.word_state(secret_word)
    game_loop(secret_word)
  end 

  def game_loop(word)
    7.times do
      "Input guess"
      word.length do |char|
        if word[char] == gets
          puts char

        else 
          puts "hi"
        end
      end
    end
  end
end 