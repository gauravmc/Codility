# Write a function:

#   def solution(a)

# that, given an array A consisting of N integers, returns 1 if there exists a triangular triplet for this array and returns 0 otherwise.

def solution(a)
  n = a.size
  return 0 unless n > 2
  a.sort!

  (2..n - 1).each do |i|
    return 1 if a[i - 2] + a[i - 1] > a[i]
  end

  return 0
end
