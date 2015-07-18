# Description:
#
#   "Any word or phrase that exactly reproduces the letters in another order is an anagram." (Wikipedia). Add numbers to this definition to be more interest.
#
#   Examples of anagrams:
#
#   William Shakespeare = I am a weakish speller
# silent = listen
# 12345 = 54321
# The challenge is to write the function isAnagram to return True if the word test is an anagram of the word original and False if not.
#
#   Note: Anagrams are case insensitive, ignore

def is_anagram(test, original)
  test.dwoncase.gsub(/\W/, "").chars.sort == original.downcase.gsub(/\W/, "").chars.sort
end

def is_anagram(test, original)
  [test, original].map { |s| s.downcase.scan(/\w/).sort }.uniq.size == 1
end

def is_anagram(test, original)
  def format(str)
    str.downcase.gsub(/\W/,"").chars.sort.join
  end

  return format(test) == format(original)
end
