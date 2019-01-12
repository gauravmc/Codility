# Write a function:

#     def solution(a, b)

# that, given two non-empty arrays A and B of Z integers, returns the number of positions K for which the prime divisors of A[K] and B[K] are exactly the same.

# For example, given:
#     A[0] = 15   B[0] = 75
#     A[1] = 10   B[1] = 30
#     A[2] = 3    B[2] = 5

# the function should return 1, because only one pair (15, 75) has the same set of prime divisors.

def solution(a, b)
  count = 0
  a.zip(b).each do |ai, bi|
    count += 1 if has_prime_divisors?(ai, bi)
  end
  count
end

def has_prime_divisors?(a, b)
  g = gcd(a, b)
  reduces_correctly?(a, g) && reduces_correctly?(b, g)
end

def reduces_correctly?(x, g)
  while x != 1
    x /= g
    g = gcd(x, g)
    break if g == 1
  end

  x == 1
end

def gcd(a, b)
  a % b == 0 ? b : gcd(b, a % b)
end
