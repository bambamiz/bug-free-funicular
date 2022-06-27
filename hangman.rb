#word will be pulled from file "house" is temp
word = "house"
class Hangman
  attr_accessor :word, :len
  def initialize(word)
    @word = word
    @len = word.length
  end
end

#method where each letter will fill in the correct guesses.
def blank_word(len, word)
  blank = ""
#creats the string the length of word, and filles it "*" as place holders
  for i in 1..len
    blank = blank + "*"
  end
  return blank
end

def comparing_letters(guess, word)
  
end

#turn left, and guesses
def turn(len, word)
  puts "you have #{len} turns remaining!"
  for i in 1..len
    puts "enter a letter"
    guess = gets.chomp.downcase

    comparing_letters(guess, word)
end

game = Hangman.new(word)
blank = blank_word(game.len, game.word)

