require 'csv'

class EventManager
 
 
  def initialize
    self.word_list  
  end

  def word_list
    @contents = File.readlines('google-10000-english-no-swears.txt')
    @contents.each do |word|
      if word.length >= 5 && word.length <= 12
      puts word
      end 

    end 



    # if zipcode.length < 5
    #   zipcode = zipcode.rjust(5, '0')
    # elsif zipcode.length > 5
    #   zipcode = zipcode[0..4]
    # end
  
    
   
  end 


end
