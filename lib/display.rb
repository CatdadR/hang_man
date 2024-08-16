
class Display

  def initialize
     
  end

  def print(string)
    puts string
  end 

  def word_state(word)
    @word = word
    @temp = Array.new(word.length, '_ ').join
    puts @temp.to_s.chomp
  end

  



end 


