require_relative 'event_manager'
require 'csv'

class GameData
  
  @@save_name = "place_holder"
  @@secret_word = %[]
  @@guessed_letters = %[]

  def initialize

  end 

  def word_list
    @word_dictionary = []
    @contents = File.readlines('google-10000-english-no-swears.txt')
    @contents.each do |word|
      if word.length >= 5 && word.length <= 12
        @word_dictionary += [word]
      end 
    end 
    secret_word = @word_dictionary.sample #HERE!!!!!!!
  end 

  def save
    if File.exist? "#{@@save_name}.csv"
      csv = CSV.open("#{@@save_name}.csv", "w") do |row|
      row << [@@secret_word]
      row << [@@guessed_letters]
      end
    else
      csv = CSV.open("#{@@save_name}.csv", "a+") do |row|
      row << [@@secret_word]
      row << [@@guessed_letters]
      end
    end
  end 

  def open
    if File.exist? "#{@@save_name}.csv"
      contents = File.readlines("#{@@save_name}.csv")
      @@secret_word = contents[0]
      @@guessed_letters = contents[1]
    end
  end
end 