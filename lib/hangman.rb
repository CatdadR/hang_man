require_relative 'game_data.rb'

class Hangman 

  def initialize
   self.start
  end

  def start
    puts "Welcome to Hangman, Please select from the following options:"
    puts "1) Start a new game "
    puts "2) Load a previous game"
    puts "3) Exit"

    @game_data = GameData.new

    case gets.chomp 
    when '1' 
      new_game
    when '2'
      puts "Loaded"
    when '3'
      puts "Exit"
    else 
      puts "Incorrect input try again."
    end
  end

  def new_game
    @game_data.word_list
    game_instance(@game_data.word, @game_data.guessed_letters)
  end

  def load_game 
    #loads a previous game 
  end

  def game_instance(secret_word, guessed_letters)
    
    @game_data.secret_word = secret_word.split("")
    puts @game_data.secret_word
    guessed_letters = []    
    
    while guessed_letters.length < 7
      guess = gets.downcase 
        if guessed_letters.include?(guess)
          puts "Try another letter"
        else
          guessed_letters += [guess] 
        end
    end
    




    #contains current game information either from a new game or loaded game 
  end


end 