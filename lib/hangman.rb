require_relative 'game_data.rb'

class Hangman 

  def initialize
   self.start
   data = GameData.new
  end

  def start
    puts "Welcome to Hangman, Please select from the following options:"
    puts "1) Start a new game "
    puts "2) Load a previous game"
    puts "3) Exit"

    case gets.chomp 
    when '1' 
      puts "started"
    when '2'
      puts "Loaded"
    when '3'
      puts "Exit"
    else 
      puts "Incorrect input try again."
    end
  end

  def new_game
    #creates a new game
  end

  def load_game 
    #loads a previous game 
  end

  def game_instance
    #contains current game information either from a new game or loaded game 
  end


end 