require 'pry-byebug'

# Global Variables:
degree = nil
sentence = nil

# Gets user's word or sentence:
loop do
  puts "\nPlease enter the sentence/word you want to cipher (only letters, numbers, and spaces are allowed):"
  puts ""
  sentence = gets.chomp
  if sentence =~ /^[a-zA-Z\s]*$/
    puts "\nThank you for your response!"
    puts ""
    break
  else
    puts "\nInvalid response. Please avoid using punctuation, numbers or special characters."
    puts ""
  end
end

# Gets user's 'degree' to cipher the sentence with:
loop do
  puts "\nPlease enter a degree to cipher with (A positive number = or more than 0)"
  puts ""
  degree = gets.chomp
  if degree.to_i.to_s == degree && degree.to_i >= 0 
    puts "\nThank you for your response!"
    puts""
    break
  else 
    puts "\nInvalid response. Please, only use whole numbers above 0."
    puts ""
  end 
end 

degree = degree.to_i 


def ceasar_cipher(sentence, degree)

  # Variables:
  alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
  sentence_chars = sentence.downcase.split("") # Each char of user's inputted sentence/word
  

  # If there are multiple words in the sentence ...
  if sentence_chars.include?(" ")                                    
    words_array = sentence.split(" ")                                # User's sentence is split into an array of it's separate words
    words_array = words_array.map {|word| word.downcase.split("")}   # Each word is split into an array of each of it's chars
    # words_array == [ ['w','o','r','d','1'] , ['w','o','r','d','2'] , ... ] 

    words_array.each_index do |index|                                # For each index of words_array...                                                                   
      words_array[index] = words_array[index].map do |char|          # For each value/char of words_array[index] ...
        alphabet_index = alphabet.find_index {|alphabet_letter| char == alphabet_letter}  
        ciphered_letter = alphabet[alphabet_index - degree]
        char = ciphered_letter                                       # Re-assign each of words_array's indexes' values/chars to 'ciphered' values/chars
      end 
      words_array[index] = words_array[index].join('')               # Join each of the values/chars of words_array[index] together to make one string
    end 
    # words_array == [ ['word1'], ['word2'], ... ]
    
    ciphered = words_array.join(" ")
    puts "\nOriginal phrase => '#{sentence}' \n\nCiphered to => '#{ciphered}' "
    puts ""



   # If sentence is just a single word ...
  else
    ciphered_chars = sentence_chars.reduce(Array.new(0)) do |accumulator, sentence_char| # 'Reduce' the sentence_chars array to an array of ciphered chars ...
    alphabet_index = alphabet.find_index {|alphabet_letter| alphabet_letter == sentence_char} 
    ciphered_letter = alphabet[alphabet_index - degree] 
    accumulator.push(ciphered_letter)
    accumulator 
  end

  puts "\nOriginal phrase => '#{sentence}' \n\nCiphered to => '#{ciphered_chars.join('')}'"
  puts""
  end 
end 

ceasar_cipher(sentence, degree)