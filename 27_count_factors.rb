# Write a function:

#     def solution(n)

# that, given a positive integer N, returns the number of its factors.

# For example, given N = 24, the function should return 8, because 24 has 8 factors, namely 1, 2, 3, 4, 6, 8, 12, 24. There are no other factors of 24.

def solution(n)
  total = 0

  i = 1
  while i * i < n
    total += 2 if n % i == 0
    i += 1
  end
  total += 1 if i * i == n

  total
end
