# Write a function:

#     def solution(n)

# that, given an integer N, returns the minimal perimeter of any rectangle whose area is exactly equal to N.

# For example, given an integer N = 30, the function should return 22, as explained above.

def solution(n)
  lowest_p = nil

  a = 1
  while a * a <= n
    if n % a == 0
      b = n / a
      current_p = 2 * (a + b)
  
      if !lowest_p || current_p < lowest_p
        lowest_p = current_p
      elsif current_p > lowest_p
        break
      end
    end

    a += 1
  end

  lowest_p
end
