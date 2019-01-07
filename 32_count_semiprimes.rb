# Write a function:

#     def solution(n, p, q)

# that, given an integer N and two non-empty arrays P and Q consisting of M integers, returns an array consisting of M elements specifying the consecutive answers to all the queries.

# For example, given an integer N = 26 and arrays P, Q such that:
#     P[0] = 1    Q[0] = 26
#     P[1] = 4    Q[1] = 10
#     P[2] = 16   Q[2] = 20

# the function should return the values [10, 4, 0], as explained above.

def solution(n, p, q)
  primes = Array.new(n + 1, true)
  s_primes = Array.new(n + 1, 0)

  i = 2
  while i * i <= n
    if primes[i]
      k = i * i
      while k <= n
        s_primes[k] = primes[k / i] ? 1 : 0
        primes[k] = false
        k += i
      end
    end
    i += 1
  end

  sums = Array.new(n + 1, 0)
  (1..s_primes.size).each do |i|
    sums[i] = sums[i - 1] + s_primes[i - 1]
  end

  result = []
  p.zip(q) {|pi, qi| result << sums[qi + 1] - sums[pi]}
  result
end
