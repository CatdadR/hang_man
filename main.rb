require_relative 'lib/event_manager'
require_relative 'lib/game_handler'
require_relative 'lib/display'
require_relative 'lib/game_instance'

def hang_man
  event_manager = EventManager.new
  game = GameHandler.new
  display = Display.new
  gameinstance = GameInstance.new

  display.print('Hangman')
  display.print('1) New Game')
  display.print('2) Load Game')
  selection = gets.chomp  
  if selection == '1' 
    game.new_game(event_manager, display)
    else if selection == '2'
     exit
    end  
  end 
end


hang_man