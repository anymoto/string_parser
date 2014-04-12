class StringParser
  def initialize(string, pattern)
    @string = string
    @pattern = pattern
  end

  def parse
    letters = letters_hash
    substring = get_substring(letters)
    substring.empty? ? nil : substring + @string
  end

  private

  def letters_hash
    hash = Hash.new(0)
    @string.each_char do |char|
      hash[char] +=1
    end

    hash
  end

  def get_substring(letters)
    substring = ''
    @pattern.each_char do |char|
      substring += char * letters[char] if letters.has_key? char
      @string.delete! char
    end
    substring
  end
end


