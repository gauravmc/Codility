# Write a function:

#     def solution(a)

# that, given a non-empty array A of N integers, returns the maximum number of flags that can be set on the peaks of the array.

# For example, the following array A:
#     A[0] = 1
#     A[1] = 5
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

# The O(N*logN) approach below gets overall 93% on Codility – 100% on correctness and 85% on performance.
# It fails only 1 perf test, and with "running time: 1.32 sec., time limit: 1.14 sec."

def solution(a)
  peaks = []

  (1...a.size - 1).each do |i|
    if a[i] > a[i - 1] && a[i] > a[i + 1]
      peaks << i
    end
  end

  total_peaks = peaks.size
  return total_peaks if total_peaks < 2

  result = 1

  (2..total_peaks).each do |max_flags|
    flags_to_plant = max_flags - 1
    last_flag_index = peaks.first

    (1...total_peaks).each do |i|
      break if flags_to_plant == 0

      if peaks[i] - last_flag_index >= max_flags
        flags_to_plant -= 1
        last_flag_index = peaks[i]
      end
    end

    flags_to_plant > 0 ? break : result = max_flags
  end

  result
end
