# Write a function:

#     def solution(s)

# that, given a string S consisting of N characters, returns 1 if string S is properly nested and 0 otherwise.

# For example, given S = "(()(())())", the function should return 1 and given S = "())", the function should return 0, as explained above.

def solution(s)
  chars = {'(' => ')'}
  char_stack = []

  s.each_char do |ch|
    if chars.key?(ch)
      char_stack.push(chars[ch])
    else
      expected = char_stack.pop
      if ch != expected
        return 0
      end
    end
  end

  char_stack.empty? ? 1 : 0
end
