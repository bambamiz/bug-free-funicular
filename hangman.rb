if File.file?("lib/google-10000-english-no-swears.txt")
  word_bank = File.open("lib/google-10000-english-no-swears.txt", "r") {|file| file.read}
end

word_bank = word_bank.split
word_bank.delete_if {|word| word.length < 5}


word = word_bank.sample(1).join
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
  usedwords = ""

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
    #checks to see if the word has been guessed before the loop ends
    if blank.eql?(word)
      i = len + 1
    end

    if usedwords.include?(guess)
      i+=1
      t-=1
    end

    i+=1
    t-=1
    usedwords = guess + usedwords

    puts blank
    puts "Letters you've already used #{usedwords}"
    puts "\n", "\n", "\n", "\n", "\n"
  end
  if blank.eql?(word)
    puts "you win!!!"
  else
    puts "you lose!!"
    puts "you enterd  #{blank}"
    puts "the word is #{word}"
  end
end

game = Hangman.new(word)
turn(game.len, game.word)
