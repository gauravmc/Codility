# Write a function:

#     def solution(a)

# that, given a non-empty array A consisting of N integers, returns the maximum number of blocks into which A can be divided.

# If A cannot be divided into some number of blocks, the function should return 0.

# For example, given:
#     A[0] = 1
#     A[1] = 2
#     A[2] = 3
#     A[3] = 4
#     A[4] = 3
#     A[5] = 4
#     A[6] = 1
#     A[7] = 2
#     A[8] = 3
#     A[9] = 4
#     A[10] = 6
#     A[11] = 2

# the function should return 3, as explained above.

def solution(a)
  n = a.size
  peaks = []

  (1...n - 1).each do |i|
    peaks << i if a[i] > a[i - 1] && a[i] > a[i + 1]
  end

  total_peaks = peaks.size
  return total_peaks if total_peaks < 2

  result = 1

  (2..total_peaks).each do |k|
    if n % k == 0
      valid_peaks = 0
      block_size = i = n / k
      peaks.each do |p|
        if p >= block_size - i && p < block_size
          valid_peaks += 1
          block_size += i
        end
      end

      result = k unless valid_peaks < k
    end
  end

  result
end
