# Write a function:

#   def solution(a)

# that, given a non-empty array A consisting of N integers, returns the starting position of the slice with the minimal average. If there is more than one slice with a minimal average, you should return the smallest starting position of such a slice.

# For example, given array A such that:
#     A[0] = 4
#     A[1] = 2
#     A[2] = 2
#     A[3] = 5
#     A[4] = 1
#     A[5] = 5
#     A[6] = 8

# the function should return 1, as explained above.

# Write an efficient algorithm for the following assumptions:

#   N is an integer within the range [2..100,000];
#   each element of array A is an integer within the range [−10,000..10,000].

# Note: This solution received 100 on correctness, but overall 60/100 on Codility

def solution(a)
  n = a.size
  prefix_sums = Array.new(n + 1, 0)
  min_avg = nil
  answer = 0

  (0...n).each do |i|
    prefix_sums[i + 1] = prefix_sums[i] + a[i]

    (0...i).each do |j|
      curr_avg = (prefix_sums[i + 1] - prefix_sums[j]).to_f / (i + 1 - j)
      min_avg ||= curr_avg

      if curr_avg < min_avg
        min_avg = curr_avg
        answer = j
      end
    end
  end

  answer
end
