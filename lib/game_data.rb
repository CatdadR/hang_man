require_relative 'hangman.rb'
require 'csv'

class GameData

  attr_accessor :secret_word, :guessed_letters, :word, :save_name, :guess_limit

  def initialize
    @secret_word = %[]
    @@save_name = "place_holder"
    @guessed_letters = []
    @guess_limit = 7
  end 

  def word_list
    @word_dictionary = []
    @contents = File.readlines('google-10000-english-no-swears.txt')
    @contents.each do |word|
      if word.length >= 5 && word.length <= 12
        @word_dictionary += [word]
      end 
    end 
    @word = @word_dictionary.sample 
  end 

  def save(save_name, guessed_letters, secret_word, guess_limit)
    @@save_name = save_name
    @guessed_letters = guessed_letters
    @secret_word = secret_word
    @guess_limit = guess_limit

    if File.exist? "#{@@save_name}.csv"
      csv = CSV.open("#{@@save_name}.csv", "w") do |row|
      row << [@secret_word]
      row << [@guessed_letters]
      row << [@guess_limit]
      end
    else
      csv = CSV.open("#{@@save_name}.csv", "a+") do |row|
      row << [@secret_word]
      row << [@guessed_letters]
      row << [@guess_limit]
      end
    end
  end 

  def open(filename)
    if File.exist? "#{filename}.csv"
      contents = CSV.read("#{filename}.csv").map(&:first)

      word = contents[0].scan(/"([^"]+)"/).flatten
      word.reject! { |char| char == '\n' }
      @secret_word = word.join
      guessed = contents[1].split
      @guessed_letters = guessed.map { |guess| guess.gsub('\n', "") }
      @guess_limit = contents[2]
      puts @guess_limit
    end
  end
end 