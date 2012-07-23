VOWELS = ["a", "e", "i", "o", "u"]

def translate(words)
  words.split.map { |word| translate_word(word) }.join(" ")
end

def translate_word(word)
  prefix = []
  rest = []
  
  prefix_ended = false
  word.split("").each_with_index do |letter, index|
    if prefix_ended
      rest << letter
    elsif not VOWELS.include?(letter)
      prefix << letter
    elsif (letter == "u") and (index > 0) and (word[index - 1] == "q")
      prefix << letter
    else
      prefix_ended = true
      rest << letter
    end
  end
  
  (rest + prefix + ["a", "y"]).join
end