# Write a function:

#     def solution(a)

# that, given a non-empty array A consisting of N integers, returns the maximal sum of any double slice.

def solution(a)
  n = a.size
  starting = Array.new(n, 0)
  ending = Array.new(n, 0)

  (1..n - 2).each {|i| starting[i] = [starting[i - 1] + a[i], 0].max}
  (1..n - 2).reverse_each {|i| ending[i] = [ending[i + 1] + a[i], 0].max}

  sum = 0
  (1..n - 2).each {|i| sum = [sum, starting[i - 1] + ending[i + 1]].max}
  sum
end
