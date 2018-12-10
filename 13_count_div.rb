# Write a function:

#  def solution(a, b, k)

# that, given three integers A, B and K, returns the number of integers within the range [A..B] that are divisible by K

def solution(a, b, k)
  result = (b / k) - (a / k)
  result += 1 if a % k == 0
  result
end
