# Write a function:

#     def solution(n, m)

# that, given two positive integers N and M, returns the number of chocolates that you will eat.

# For example, given integers N = 10 and M = 4. the function should return 5, as explained above.

def solution(n, m)
  n / gcd(n, m)
end

def gcd(n, m)
  n % m == 0 ? m : gcd(m, n % m)
end
