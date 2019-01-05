# Write a function:

#     def solution(a)

# that, given an array A consisting of N integers, returns a sequence of integers representing the amount of non-divisors.

# Result array should be returned as an array of integers.

# For example, given:
#     A[0] = 3
#     A[1] = 1
#     A[2] = 2
#     A[3] = 3
#     A[4] = 6

# the function should return [2, 4, 3, 2, 0], as explained above.

def solution(a)
  factors = factors_sieve(a)
  n = a.size
  a.map {|num| n - factors[num]}
end

def factors_sieve(a)
  n = a.max
  factors = Array.new(n + 1, 0)
  counts = a.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }

  (1..n).each do |i|
    k = i
    while k <= n
      factors[k] += counts[i]
      k += i
    end
  end

  factors
end
