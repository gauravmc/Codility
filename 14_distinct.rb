# Write a function

#   def solution(a)

# that, given an array A consisting of N integers, returns the number of distinct values in array A.

def solution(a)
  # In production environment this will be my solution:
  # a.uniq.size
  #
  # But since this is a coding challenge, my assumption
  # is that you're looking for a by-hand O(N*logN) solution

  return 0 if a.empty?

  n = a.size
  ary = a.sort
  uniques = 1
  (1...n).each do |i|
    uniques += 1 if ary[i] != ary[i - 1]
  end
  uniques
end
