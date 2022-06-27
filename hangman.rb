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

#method to fill in the blanks with the correct letters based on the guess
def matching_letters(blank, word, guess)
  dex = 0
  word.each_char {|c| 
    if c == guess
      blank[dex] = guess
    end
    dex+=1
  }
end

#turn left, and guesses
def turn(len, word)
  blank = blank_word(len, word)
  t = len
  i = 0

  #loop that will run for a number of turns. 
  while i < len
    puts "you have #{t} turns left!"
    puts "enter a letter"
    guess = gets.chomp.downcase

    #cheks if the (guess) letter exist in the word. if it does the turn doesn't count against you
    comparrison = word.count(guess)
    if comparrison > 0
      matching_letters(blank, word, guess)
      t+=1
      i-=1
    end
    
    if blank.eql?(word)
      i = len + 1
    end

    i+=1
    t-=1
    puts blank
    puts "\n", "\n"
  end
  if blank.eql?(word)
    puts "you win!!!"
  else
    puts "you lose!!"
  end
end

game = Hangman.new(word)
turn(game.len, game.word)
