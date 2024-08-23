require_relative 'game_data.rb'
require_relative 'display.rb'

class Hangman 

  def initialize
   self.start
  end

  def start
    puts "Welcome to Hangman, Please select from the following options:"
    puts "1) Start a new game "
    puts "2) Load a previous game"
    puts "3) Exit"

    @@game_data = GameData.new
    @display = Display.new

    case gets.chomp 
    when '1' 
      new_game
    when '2'
      load_game
    when '3'
      puts "Exit"
    else 
      puts "Incorrect input try again."
    end
  end

  def new_game
    @@game_data.word_list
    game_instance(@@game_data.word, @@game_data.guessed_letters, 7)
  end

  def load_game 
    puts "Input filename"
    @@game_data.open("#{gets.chomp}")
    game_instance(@@game_data.secret_word, @@game_data.guessed_letters, @@game_data.guess_limit)
  end

  def game_instance(secret_word, guessed_letters, guess_limit)
    @@game_data.secret_word = secret_word.split("")
    @word_display = Array.new(@@game_data.secret_word.length, "_ ")
    @@guessed_letters = guessed_letters    
    @@guess_limit = guess_limit.to_i
    puts @word_display.join
    while @@guess_limit >= 0
      @@guess = gets.downcase 
      if @@guess.chomp == "1"
        puts "enter save name" 
        @@game_data.save(@@game_data.save_name = "#{gets.chomp}", @@guessed_letters, @@game_data.secret_word, @@guess_limit)
      end 
      if @@guessed_letters.include?(@@guess)
        puts "Try another letter"
      else 
        @@guessed_letters += [@@guess] 
        @@game_data.secret_word.length.times do |n|
          if @@guessed_letters.join.include?(@@game_data.secret_word[n])
              @word_display[n] = @@game_data.secret_word[n]     
          end
        end
        if @@game_data.secret_word.include?(@@guess.chomp)
        else 
          @@guess_limit += -1
        end 
        @display.board_state(@@guess_limit)
        puts @word_display.join
        if @@game_data.secret_word == @word_display
          puts "You win"
          exit 
        end
      end
    end
    puts "You loose the secret word was #{@@game_data.secret_word.join}"
    exit
  end
end 